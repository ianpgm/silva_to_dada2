This is a [Julia](https://julialang.org/) script to turn Silva databases in FASTA format into a format suitable for use in the `assignTaxonomy` function of [dada2](https://benjjneb.github.io/dada2/). The script truncates the taxonomies to a user-specified maximum number of levels, removes any trailing taxa that start with "uncultured", replaces spaces in taxon names with underscores, adds a trailing semicolon to the taxon string, replaces genus names "Escherichia-Shigella" with "Escherichia/Shigella", and removes the sequence ID. The `U`s in the Silva sequence are replaced with `T`s.

## Usage

First of all you will need to download and unzip the desired Silva database from the [Silva FTP site](http://ftp.arb-silva.de/). An example:

    wget http://ftp.arb-silva.de/current/Exports/SILVA_132_SSURef_Nr99_tax_silva_trunc.fasta.gz
    gunzip SILVA_132_SSURef_Nr99_tax_silva_trunc.fasta.gz

Provided you have [Julia](https://julialang.org/) installed and in your `PATH` and you copy the script in this repository to the same directory as your downloads, you will be able to run the script like so:

    julia silva_to_dada2.jl --input SILVA_132_SSURef_Nr99_tax_silva_trunc.fasta --levels 6 --output SILVA_132_SSURef_Nr99_tax_silva_trunc_dada2.fasta

Where `--input` specifies the database fasta file, `--levels` specifies the maximum number of taxonomic levels to truncate to (6 or 7 will usually be the right numbers here), and `--output` specified the desired name of the output file.
