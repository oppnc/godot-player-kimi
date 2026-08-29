# PackedDataContainerRef

> class PackedDataContainerRef ; deprecated=Use `@GlobalScope.var_to_bytes` or `FileAccess.store_var` instead. To enable data compression, use `PackedByteArray.compress` or `FileAccess.open_compressed`.
> inherits PackedDataContainerRef RefCounted

## Brief

An internal class used by `PackedDataContainer` to pack nested arrays and dictionaries.

## Description

When packing nested containers using `PackedDataContainer`, they are recursively packed into `PackedDataContainerRef` (only applies to `Array` and `Dictionary`). Their data can be retrieved the same way as from `PackedDataContainer`.

```text
        var packed = PackedDataContainer.new()
        packed.pack([1, 2, 3, ["nested1", "nested2"], 4, 5, 6])

        for element in packed:
            if element is PackedDataContainerRef:
                for subelement in element:
                    print("::", subelement)
            else:
                print(element)

```

Prints:

```text
        1
        2
        3
        ::nested1
        ::nested2
        4
        5
        6

```

## Methods

> method size() -> int ; qualifiers=const

Returns the size of the packed container (see `Array.size` and `Dictionary.size`).
