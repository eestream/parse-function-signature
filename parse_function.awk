


{
    print $0
    if($0 ~ /\s*(\w*)\s+(\w*)\s*\((\s*((\w+\s+)?(\w+)\s+(\w+))?,?)*\);$/)#if this line is a function signature
    {
        ret = gensub(/\s*(\w*)\s+(\w*)\s*\((\s*((\w+\s+)?(\w+)\s+(\w+))?,?)*\);$/, "\\1", "g", $0);
        function_name = gensub(/\s*(\w*)\s+(\w*)\s*\((\s*((\w+\s+)?(\w+)\s+(\w+))?,?)*\);$/, "\\2", "g", $0);
        allparameters = gensub(/\s*(\w*)\s+(\w*)\s*\((.*)\);$/, "\\3", "g", $0);


        print "Return Type: " ret
        print "Function Name: "function_name
        argc = split(allparameters, parameter, ",")

        for(i=1; i<=argc; i++){
            print "parameter["i"]"
            print parameter[i]
            para_count = split(parameter[i], value)
            if(para_count==3){ #case1: const type parameter
                print "Parameter Type: "value[2];
                print "Parameter: "value[3];
            }
            else if(para_count==2){ #case2: type parameter
                print "Parameter Type: "value[1];
                print "Parameter: "value[2];
            }
            print ""
        }
        print ""
    }

}
