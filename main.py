import math
# stage 1- removing unnessesery nozzle moves

a_file = open("org.gcode", "r")
lines = a_file.readlines()
a_file.close()
prev_e = 0
new_e = 0
memory_x = []
memory_line = []



new_x = 0
delta_x = 0
last_x = 0

start_line = input("starting layer number")
end_line = input("ending layer number")
starting_string = ";LAYER:" + str(start_line) + "\n"
starting_string2 = ";LAYER:" + str(int(start_line) + 1) + "\n"
ending_string = ";LAYER:" + str(end_line) + "\n"
ending_string2 = ";LAYER:" + str(int(end_line) - 1) + "\n"
edit_switch = False
exclude_line_switch = False
e_code_switch = False
exclude_offset = 0
new_file = open("output.gcode", "w")
layer = 0
last_layer_lenght = 0
lenght_progression = 0

for line in lines:

    if line == starting_string:
        edit_switch = True
    elif line == ending_string:
        edit_switch = False
    if line.find(";LAYER:") == 0:       #leave the layer comments(rewrite it and skip the iteration)
        new_file.write(line)
        continue
    if edit_switch:
        for word in line.split():
            if word.find("X") == 0:     #if "e" is the first letter in word
                new_x =int(round(float(word[1:])* 1000))
                memory_x.append(new_x)
                if len(memory_x) == 4:  # keep memory_x list lenght= 3 by removing last element
                    memory_x.pop(0)
            if word.find("E") == 0:     #if E is first letter of word
                new_e =int(round(float(word[1:])* 100000))      #converting to int from float
                if new_e == prev_e - 500000:  # retraction 5mm backward
                    exclude_line_switch = True
                    delta_x = memory_x[1] - memory_x[2]
                    last_x = memory_x[2]
                if new_x < last_x - delta_x and line.find("X") > 0:  # if nozzle is in continous position
                    exclude_line_switch = False
            if new_e == 0:
                prev_e = new_e
        if not exclude_line_switch:
            new_file.write(line)
        prev_e = new_e
        continue
    new_file.write(line)
new_file.close()


#stage 2- adding appropriate Extrusion value for the move where the glithy moves was deleted


a_file = open("output.gcode", "r")
lines = a_file.readlines()
a_file.close()
new_file = open("output2.gcode", "w")

for line in lines:

    if line == starting_string2:
        edit_switch = True
    elif line == ending_string:
        edit_switch = False
    if line.find(";LAYER:") == 0:       #leave the layer comments(rewrite it and skip the selection)
        new_file.write(line)
        e_code_switch = True
        continue
    memory_line.append(line)
    if len(memory_line) == 4:  # keep memory_line list lenght= 3 by removing last element
        memory_line.pop(0)

    if edit_switch and e_code_switch:
        for word in memory_line[2].split():
            if word.find("X") == 0:
                x1 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y1 = int(round(float(word[1:]) *1000))
            if word.find("E") == 0:
                e1 = float(word[1:])
        for word in memory_line[1].split():
            if word.find("X") == 0:
                x2 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y2 = int(round(float(word[1:]) *1000))
            if word.find("E") == 0:
                e2 = float(word[1:])

        line_lenght = math.sqrt(math.pow(x2-x1, 2) + math.pow(y2-y1, 2))
        new_extrusion_lenght = (line_lenght/490)*(0.15376)
        new_extrusion_value = round(e1 - new_extrusion_lenght, 5)
        extrusion_code = "G92 E" + str(new_extrusion_value) + "\n"
        new_file.write(extrusion_code)
        new_file.write(line)

        e_code_switch = False
    else:
        new_file.write(line)

new_file.close()

# stage 3 - calculating last layer lenght. Because of the error- Cura cut off the rest of object "crown"

a_file = open("output2.gcode", "r")
lines = a_file.readlines()
a_file.close()

for line in lines:

    if line == ending_string2:      # pass the line with layer label
        edit_switch = True
        continue
    if line.find("G92") == 0:      # pass the line with layer label
        continue
    elif line == ending_string:
        edit_switch = False
    memory_line.append(line)
    if len(memory_line) == 5:  # keep memory_line list lenght= 3 by removing last element
        memory_line.pop(0)

    if edit_switch:
        for word in memory_line[3].split():
            if word.find("X") == 0:
                x1 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y1 = int(round(float(word[1:]) *1000))

        for word in memory_line[2].split():
            if word.find("X") == 0:
                x2 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y2 = int(round(float(word[1:]) *1000))
        line_lenght = math.sqrt(math.pow(x2-x1, 2) + math.pow(y2-y1, 2))
        last_layer_lenght += line_lenght

# stage 4 - recalculating last layer extrusion and Z position (constant)

a_file = open("output2.gcode", "r")
lines = a_file.readlines()
a_file.close()
new_file = open("output3.gcode", "w")

for line in lines:

    if line == ending_string2:      # pass the line with layer label
        edit_switch = True
        new_file.write(line)
        prev_e = (float(memory_line[3][memory_line[3].find("E")+1:]))*100000
        print(prev_e)
        continue
    if line.find("G92") == 0:      # pass the line with layer label
        new_file.write(line)
        continue
    elif line == ending_string:
        edit_switch = False
        local_line = "G1 " + memory_line[3][memory_line[3].find("Z"):memory_line[3].find(" ", memory_line[3].find("Z"))] + "\n"
        new_file.write(local_line)
    memory_line.append(line)
    if len(memory_line) == 5:  # keep memory_line list lenght= 4 by removing last element
        memory_line.pop(0)


    if edit_switch:
        for word in memory_line[3].split():
            if word.find("X") == 0:
                x1 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y1 = int(round(float(word[1:]) *1000))
            if word.find("E") == 0:
                e1 = int(round(float(word[1:]) *100000))
        for word in memory_line[2].split():
            if word.find("X") == 0:
                x2 = int(round(float(word[1:]) *1000))
            if word.find("Y") == 0:
                y2 = int(round(float(word[1:]) *1000))
            if word.find("E") == 0:
                e2 = int(round(float(word[1:]) *100000))

        line_lenght = math.sqrt(math.pow(x1-x2, 2) + math.pow(y1-y2, 2))
        lenght_progression += line_lenght
        delta_e = e1 - e2
        new_extrusion_value = str(round((float(prev_e + (1 - (lenght_progression/last_layer_lenght))*delta_e)/ 100000), 8))
        prev_e += (1 - (lenght_progression/last_layer_lenght))*delta_e
        extrusion_code = "E" + str(new_extrusion_value)


        if memory_line[3].find("Z")>0:
            memory = memory_line[3][0:memory_line[3].find("Z")]     # cut out from Z to end of line
        else:
            memory = memory_line[3][0:memory_line[3].find("E")]     # cut out from E to end of line
        memory += extrusion_code + "\n"

        new_file.write(memory)
    else:
        new_file.write(line)

new_file.close()