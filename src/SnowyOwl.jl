module SnowyOwl

using PyCall
using SparseArrays
using CSV, DataFrames
using CodecZlib, Mmap
using JLD2
using DataStructures: OrderedDict

import DataFrames: nrow, ncol

const DEFAULT_FEATURE_COLS = [:ensembleid, :genesymbol, :type]
const DEFAULT_BARCODE_COLS = [:barcode]
const FEATURE_COLS = [:featurekey, :featurename, :featuretype, :chromosome, :featurestart, :featureend, :isgene, :genus_species]

export
    # io
    read_mtx,
    read_features,
    read_barcodes,
    read_genes,
    read_cells,

    # object
    Profile,
    obsnames,
    varnames,
    layernames,
    nrow,
    ncol,
    nvar,
    nobs,
    get_gene_expr,

    # datasets
    load_pbmc68k,

    # filter
    filter_cells!,
    filter_cells,
    filter_genes!,
    filter_genes,

    # qc
    quality_control_metrics!,
    quality_control_metrics

    #moments
    normalize_indicator,
    to_indicator_matrix,
    union_diagonal!,
    graph_filter,
    moment,
    first_moment

include("io.jl")
include("object.jl")
include("datasets.jl")
include("preprocess/filter.jl")
include("qc.jl")
include("moments.jl")

end
