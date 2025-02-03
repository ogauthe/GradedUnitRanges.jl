using LabelledNumbers: LabelledInteger, label, labelled, unlabel

# default behavior: any object is self-dual
dual(x) = x
nondual(r::AbstractUnitRange) = r
isdual(::AbstractUnitRange) = false

dual_type(x) = dual_type(typeof(x))
dual_type(T::Type) = T
nondual_type(x) = nondual_type(typeof(x))
nondual_type(T::Type) = T

dual(i::LabelledInteger) = labelled(unlabel(i), dual(label(i)))
dual(p::Pair{<:Any,<:Base.OneTo}) = dual(first(p)) => last(p)
flip(a::AbstractUnitRange) = dual(map_blocklabels(dual, a))
