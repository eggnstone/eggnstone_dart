extension MapExtension<K, V> on Map<K, V>
{
    MapEntry<K, V>? firstOrNull(bool Function(MapEntry<K, V>) f)
    {
        for (final MapEntry<K, V> entry in entries)
            if (f(entry))
                return entry;

        return null;
    }

    V? firstValueOrNull(bool Function(V) f)
    {
        for (final V value in values)
            if (f(value))
                return value;

        return null;
    }
}
