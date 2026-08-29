# PackedDataContainer

> class PackedDataContainer ; deprecated=Use `@GlobalScope.var_to_bytes` or `FileAccess.store_var` instead. To enable data compression, use `PackedByteArray.compress` or `FileAccess.open_compressed`.
> inherits PackedDataContainer Resource

## Brief

Efficiently packs and serializes `Array` or `Dictionary`.

## Description

`PackedDataContainer` can be used to efficiently store data from untyped containers. The data is packed into raw bytes and can be saved to file. Only `Array` and `Dictionary` can be stored this way.
You can retrieve the data by iterating on the container, which will work as if iterating on the packed data itself. If the packed container is a `Dictionary`, the data can be retrieved by key names (`String`/`StringName` only).

```text
        var data = { "key": "value", "another_key": 123, "lock": Vector2() }
        var packed = PackedDataContainer.new()
        packed.pack(data)
        ResourceSaver.save(packed, "packed_data.res")

```

```text
        var container = load("packed_data.res")
        for key in container:
            prints(key, container[key])

```

Prints:

```text
        key value
        lock (0, 0)
        another_key 123

```

Nested containers will be packed recursively. While iterating, they will be returned as `PackedDataContainerRef`.

## Methods

> method pack(value: Variant) -> Error

Packs the given container into a binary representation. The `value` must be either `Array` or `Dictionary`, any other type will result in invalid data error.
**Note:** Subsequent calls to this method will overwrite the existing data.

> method size() -> int ; qualifiers=const

Returns the size of the packed container (see `Array.size` and `Dictionary.size`).
