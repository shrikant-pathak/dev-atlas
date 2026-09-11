# Lesson 1: Typed Arrays and ArrayBuffer

## Learning Objectives
- Understand what an `ArrayBuffer` is and why JavaScript needed a way to work with raw binary data
- Use `TypedArray` views (`Int8Array`, `Uint8Array`, `Float32Array`, etc.) to read and write binary data
- Understand `DataView` for working with mixed-type binary data and endianness
- Recognize where typed arrays show up in real-world APIs (WebGL, file handling, WebSockets, audio)

## Introduction

Every array you've used so far — from Module 03's `Array` methods to Module 06's destructuring — has been a regular JavaScript array: dynamically sized, able to hold any mix of types, and optimized for general-purpose use. But regular arrays are a poor fit for one specific job: working with raw binary data efficiently.

When JavaScript needs to talk to a GPU (WebGL), decode an image, process audio samples, or read bytes from a file or network socket, it needs a fixed-size, single-type, memory-efficient buffer — the same shape of data a language like C would use. That's what `ArrayBuffer` and typed arrays provide.

Think of it like the difference between a suitcase and a shipping container. A regular array (the suitcase) can hold anything, in any order, and grows or shrinks as needed. An `ArrayBuffer` (the shipping container) is a fixed-size block of raw memory, and a typed array is the label on the container telling you: "this container holds 32-bit floats, and here's how many."

## The ArrayBuffer

An `ArrayBuffer` is just a fixed-length block of raw bytes. You can't read or write to it directly — it has no methods for getting or setting values. It's purely a chunk of memory.

```js
const buffer = new ArrayBuffer(16); // 16 bytes of raw memory
console.log(buffer.byteLength); // 16
```

On its own, this buffer is opaque. To actually put data into it or read data out of it, you need a **view**.

## Typed Array Views

A typed array is a view over an `ArrayBuffer` that interprets the raw bytes as a specific numeric type. JavaScript provides several typed array constructors, each corresponding to a different numeric type and byte size:

| Type | Bytes per element | Range |
|---|---|---|
| `Int8Array` | 1 | -128 to 127 |
| `Uint8Array` | 1 | 0 to 255 |
| `Uint8ClampedArray` | 1 | 0 to 255 (clamps instead of wrapping) |
| `Int16Array` | 2 | -32768 to 32767 |
| `Uint16Array` | 2 | 0 to 65535 |
| `Int32Array` | 4 | -2^31 to 2^31-1 |
| `Uint32Array` | 4 | 0 to 2^32-1 |
| `Float32Array` | 4 | single-precision float |
| `Float64Array` | 8 | double-precision float (same as a normal JS number) |

You can create a typed array in a few ways:

```js
// From an existing buffer
const buffer = new ArrayBuffer(16);
const view = new Int32Array(buffer); // 4 elements, since each Int32 is 4 bytes
console.log(view.length); // 4

// Directly, letting the typed array create its own buffer
const floats = new Float32Array(4); // 4 elements, 16 bytes
floats[0] = 3.14;
console.log(floats); // Float32Array(4) [3.140000104904175, 0, 0, 0]

// From a regular array
const ints = Int16Array.from([10, 20, 30]);
console.log(ints); // Int16Array(3) [10, 20, 30]
```

Notice something important in that second example: `3.14` came back as `3.140000104904175`. This is `Float32Array` losing precision compared to the `Float64` numbers you're used to from Module 03 — a direct, visible consequence of the fixed byte-width you chose.

Typed arrays support many of the same methods as regular arrays that you learned in Module 03 — `.map()`, `.filter()`, `.forEach()`, `.slice()` — but `.map()` and `.filter()` on a typed array always return a new typed array of the *same* type, not a plain array.

```js
const nums = new Int32Array([1, 2, 3, 4, 5]);
const doubled = nums.map(n => n * 2);
console.log(doubled); // Int32Array(5) [2, 4, 6, 8, 10]
```

## Multiple Views, One Buffer

The real power of `ArrayBuffer` is that multiple views can share the *same* underlying memory. This lets you reinterpret the same bytes as different types without copying anything.

```js
const buffer = new ArrayBuffer(4);
const asInt8 = new Uint8Array(buffer);
const asInt32 = new Uint32Array(buffer);

asInt32[0] = 1; // set the whole 4 bytes as one 32-bit number

console.log(asInt8); // Uint8Array(4) [1, 0, 0, 0] (on little-endian systems)
```

Changing `asInt32[0]` changed what `asInt8` sees, because they're both looking at the exact same 4 bytes in memory — just interpreting them differently. This is the essence of why typed arrays exist: it's the same raw data, reinterpreted, with zero copying.

## DataView: Precise Control and Endianness

Typed arrays assume every element in the buffer is the same type. But real binary formats — file headers, network protocols — often mix types: a 2-byte flag, followed by a 4-byte integer, followed by an 8-byte float. For that, use `DataView`, which lets you read and write specific types at specific byte offsets.

```js
const buffer = new ArrayBuffer(8);
const view = new DataView(buffer);

view.setInt16(0, 42);       // write a 16-bit int at byte offset 0
view.setFloat32(2, 3.14);   // write a 32-bit float at byte offset 2

console.log(view.getInt16(0));    // 42
console.log(view.getFloat32(2));  // 3.140000104904175
```

`DataView` also lets you control **endianness** — the order in which bytes are arranged in memory. Most methods take an optional second (or third) boolean argument for little-endian mode:

```js
view.setUint32(0, 1, true);  // little-endian
view.setUint32(0, 1, false); // big-endian (default)
```

You rarely need to worry about endianness in everyday JavaScript, but it matters the moment you're parsing a binary file format or network protocol that specifies a byte order — which is exactly the kind of task typed arrays exist for.

## Where This Actually Shows Up

Typed arrays aren't an academic corner of JavaScript — you'll run into them:

- **WebGL / Canvas** (next lesson): vertex data, pixel buffers, and image data are all typed arrays under the hood.
- **`fetch()`** (Module 05): `response.arrayBuffer()` lets you get raw binary data from a network request — useful for images, audio files, or custom binary APIs.
- **Web Audio API**: raw audio sample data is stored in `Float32Array` buffers.
- **File API**: `FileReader.readAsArrayBuffer()` reads an uploaded file's raw bytes.
- **WebSockets**: binary WebSocket messages arrive as `ArrayBuffer` or `Blob`.

```js
// Example: fetching an image as raw bytes
async function getImageBytes(url) {
  const response = await fetch(url);
  const buffer = await response.arrayBuffer();
  const bytes = new Uint8Array(buffer);
  console.log(`Got ${bytes.length} bytes`);
  return bytes;
}
```

## Practical Example

A common real-world task: checking a file's "magic number" — the first few bytes of a file that identify its format, regardless of file extension. PNG files, for example, always start with the same 8 bytes.

```js
async function isPNG(file) {
  const buffer = await file.arrayBuffer(); // File objects support this too
  const bytes = new Uint8Array(buffer);

  const pngSignature = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];

  for (let i = 0; i < pngSignature.length; i++) {
    if (bytes[i] !== pngSignature[i]) {
      return false;
    }
  }
  return true;
}

// Usage with a file input
fileInput.addEventListener('change', async (e) => {
  const file = e.target.files[0];
  const result = await isPNG(file);
  console.log(result ? 'This is a PNG!' : 'Not a PNG.');
});
```

This works regardless of what the file is named — `photo.png`, `photo.jpg` renamed to `.png`, or no extension at all — because it inspects the actual bytes, something a regular array of numbers could technically do too, but a typed array does with the correct semantics and far better performance for larger files.

## Revision Questions

<details>
<summary>1. What's the difference between an ArrayBuffer and a TypedArray?</summary>

An `ArrayBuffer` is a fixed-length block of raw memory with no way to read or write values directly. A `TypedArray` (like `Int32Array` or `Float64Array`) is a *view* over an `ArrayBuffer` that interprets those raw bytes as a specific numeric type, giving you indexed read/write access.
</details>

<details>
<summary>2. Why might two typed arrays of different types share the same ArrayBuffer, and what happens when you write to one of them?</summary>

Multiple views can be created over the same buffer to reinterpret the same underlying bytes as different types, without copying memory. Writing through one view changes the underlying bytes, which is immediately visible through any other view over that same buffer, since there's only one copy of the data.
</details>

<details>
<summary>3. When would you reach for DataView instead of a plain TypedArray?</summary>

When the binary data mixes multiple types at specific byte offsets (like a file header with a 2-byte flag followed by a 4-byte integer), or when you need explicit control over endianness. A single TypedArray assumes every element is the same type and size, which doesn't fit mixed binary formats.
</details>

<details>
<summary>4. Why did storing 3.14 in a Float32Array produce 3.140000104904175 instead of 3.14?</summary>

`Float32Array` uses single-precision (32-bit) floating point, which has less precision than the double-precision (64-bit) floats JavaScript numbers normally use. The value 3.14 can't be represented exactly in 32 bits, so it's rounded to the nearest representable value, which shows up as that longer decimal when read back out.
</details>
