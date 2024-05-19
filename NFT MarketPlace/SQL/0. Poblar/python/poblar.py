import hashlib

def generate_hash(data, max_length=300):
    # Calculate the SHA-256 hash of the data
    hash_object = hashlib.sha256(data.encode())
    hash_hex = hash_object.hexdigest()

    # Truncate the hash to the desired length
    truncated_hash = hash_hex[:max_length]

    return truncated_hash

# Example usage
data = "Hello, world!"
hash_value = generate_hash(data)
print("Hash:", hash_value)
print("Length:", len(hash_value))
