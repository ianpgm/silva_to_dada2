function limit_taxon_depth(ID_line::String,levels::Int)
    taxa = join(split(ID_line,' ')[2:end],' ')
    if length(split(taxa,';')) < levels
        levels = length(split(taxa,';'))
    end
    limited_taxa = join(split(taxa,';')[1:levels],';')*";"
    return limited_taxa
end

function process_line(line::String,levels::Int)
    if startswith(line,">")
        return ">"*replace(limit_taxon_depth(line::String,levels::Int)," ","_")*"\n"
    else
        return replace(line,"U","T")*"\n"
    end
end

function process_file(filename::String,levels::Int,output_filename::String)
    output = open(output_filename,"w")
    for line in eachline(filename)
        write(output,process_line(line,levels))
    end
end

function main()
    parameter_dict = Dict(zip(ARGS[1:2:5],ARGS[2:2:6]))
    process_file(parameter_dict["--input"],parse(Int,parameter_dict["--levels"]),parameter_dict["--output"])
end

main()