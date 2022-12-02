import gdb

def printer(event):

    rsp = hex(gdb.parse_and_eval("$rsp"))
    rbp = hex(gdb.parse_and_eval("$rbp"))
    str_o = "00 00 00 00 00 00 00 00"

    # Here I'm Adding Important Condition As Per Point-6

    if ( int(rsp,16) < int(rbp,16) ) :
        # Function For Executing GDB command Using Python
        l = int(rbp,16)-int(rsp,16)
        output_rsp = ""

        # --------------------------------------- RSP --------------------------------------------

        for i in range(l//8) :
            s =  "x/8xb " + rsp
            output_rsp += gdb.execute(s,to_string=True)
            rsp = hex((int(rsp,16))+8)

        l_rsp = output_rsp.split('\n')[:-1]
        str_rsp = ""

        f = int(1)

        for ele in l_rsp :
            temp =  str(ele.split(':')[-1]).split('\t')[1:]

            str_rsp += "+-------------------------+\n| "

            for x in temp :
                str_rsp += x[2:] + " "

            if f == 1 :
                str_rsp += "| <- rsp\n"
            else :
                str_rsp += "|\n"
            f += 1

        str_rsp += "+-------------------------+"
        print(str_rsp)

        # ----------------------------------------- RBP -------------------------------------------

        str_rbp = ""
        f = int(1)

        while True :
            s = "x/8xb " + rbp
            c_rbp = gdb.execute(s,to_string=True)
            rbp = hex((int(rbp,16))+8)

            comp = str(c_rbp.split(':')[-1]).split('\t')[1:]
            temp_rbp = ""

            for x in comp :
                temp_rbp += x[2:] + " "

            temp_rbp = temp_rbp[:23]

            if temp_rbp == str_o :
                break
            else :
                if f == 1 :
                    str_rbp += "| " + temp_rbp + " | <- rbp\n"
                else :
                    str_rbp += "\n| " + temp_rbp + " |\n"
                f += 1
                str_rbp += "+-------------------------+"

        str_rbp += "\n| " +  str_o +  " |\n+-------------------------+"
        print(str_rbp)

    elif ( rsp == rbp ) :
        str_rbp = ""
        f = int(1)

        while True :
            s = "x/8xb " + rbp
            c_rbp = gdb.execute(s,to_string=True)
            rbp = hex((int(rbp,16))+8)

            comp = str(c_rbp.split(':')[-1]).split('\t')[1:]
            temp_rbp = ""

            for x in comp :
                temp_rbp += x[2:] + " "

            temp_rbp = temp_rbp[:23]

            if temp_rbp == str_o :
                break
            else :
                if f == 1 :
                    str_rbp += "| " + temp_rbp + " | <- rbp rsp\n"
                else :
                    str_rbp += "\n| " + temp_rbp + " |\n"
                f += 1
                str_rbp += "+-------------------------+"

        str_rbp += "\n| " + str_o + " |\n+-------------------------+"
        print(str_rbp)

gdb.events.stop.connect(printer)

