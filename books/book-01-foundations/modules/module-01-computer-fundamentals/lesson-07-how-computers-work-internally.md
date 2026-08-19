# Lesson 07: How Computers Work Internally

## Learning Objectives

By the end of this lesson, you will be able to:

- Explain how a computer processes information.
- Describe what happens when a computer is powered on.
- Understand the roles of the CPU, RAM, storage, and motherboard.
- Explain the Fetch–Decode–Execute cycle.
- Understand how software is executed by hardware.
- Trace the journey of data from input to output.

---

# 1. Introduction

When you press a key on the keyboard, click the mouse, or launch an application, the computer performs thousands to millions of operations in a fraction of a second. Although these actions appear instantaneous, they involve continuous communication between hardware components.

A computer works by accepting data, processing it according to instructions, storing it when necessary, and presenting the results to the user. Every modern computer—from a smartphone to a supercomputer—follows this same fundamental principle.

Understanding how a computer works internally is one of the most important foundations in computer science. It helps developers write efficient software, troubleshoot problems, optimize performance, and better understand how operating systems and applications interact with hardware.

---

# The Four Basic Functions of a Computer

Every computer performs four fundamental operations:

1. **Input** – Receives data from input devices.
2. **Processing** – The CPU processes the received instructions.
3. **Storage** – Data is stored temporarily in RAM or permanently on storage devices.
4. **Output** – The processed information is presented to the user.

This process happens continuously while the computer is running.

```
Input → Processing → Storage → Output
```

---

# A Simple Example

Suppose you type the word:

```
Hello
```

Here's what happens internally:

1. You press the **H** key.
2. The keyboard converts the key press into an electrical signal.
3. The motherboard sends the signal to the CPU.
4. The CPU interprets the input.
5. The operating system decides where the character should appear.
6. The character is temporarily stored in RAM.
7. The graphics system updates the display.
8. The monitor shows the letter **H**.

The same process repeats for every character you type.

Although this seems simple, billions of tiny electronic operations occur every second.

---

# Main Components Involved

Several hardware components work together during every operation.

| Component | Purpose |
|-----------|---------|
| CPU | Executes instructions and performs calculations |
| RAM | Temporarily stores data currently in use |
| Storage (SSD/HDD) | Permanently stores programs and files |
| Motherboard | Connects all hardware components |
| Input Devices | Send data to the computer |
| Output Devices | Display processed information |
| Power Supply | Provides electrical power to all components |

Each component has a specific responsibility, and none can perform all tasks alone.

---

# How Data Flows Inside a Computer

The internal workflow of a computer can be represented as:

```
Input Device
      │
      ▼
 Motherboard
      │
      ▼
     RAM
      │
      ▼
     CPU
      │
      ▼
 Processed Data
      │
      ▼
 RAM / Storage
      │
      ▼
 Output Device
```

Every action follows a similar path, whether you open a file, browse the web, watch a video, or play a game.

---

# Why Understanding Internal Operations Matters

Knowing how computers work internally helps you:

- Write more efficient programs.
- Understand why computers slow down.
- Troubleshoot hardware and software problems.
- Learn operating systems more easily.
- Understand networking and cybersecurity concepts.
- Prepare for technical interviews and certification exams.

This knowledge forms the foundation for advanced topics such as operating systems, computer architecture, compilers, databases, and software development.


# 2. What Happens When You Press the Power Button?

Pressing the **Power** button may seem like a simple action, but it starts a carefully coordinated sequence of hardware and software operations. Within a few seconds, thousands of components begin working together to prepare the computer for use.

This startup sequence is called the **boot process**.

Without the boot process, the computer would not know how to initialize its hardware, locate the operating system, or display anything on the screen.

---

# Step 1: Power Supply Starts

When you press the power button:

- The power button sends a signal to the motherboard.
- The motherboard instructs the Power Supply Unit (PSU) to begin supplying electricity.
- The PSU converts AC power from the wall outlet into regulated DC voltages required by the computer's components.
- Electricity is distributed to the motherboard, CPU, RAM, storage devices, graphics card, cooling fans, and other hardware.

Once stable power is available, the CPU is released from its reset state and begins executing its first instruction.

---

# Step 2: CPU Executes Firmware

Unlike software stored on the SSD or hard drive, every computer contains firmware stored on a special memory chip attached to the motherboard.

This firmware is either:

- **BIOS (Basic Input/Output System)** on older systems, or
- **UEFI (Unified Extensible Firmware Interface)** on modern computers.

The CPU starts by executing instructions from this firmware because it has no operating system loaded yet.

The firmware's responsibilities include:

- Initializing hardware
- Checking connected devices
- Configuring memory
- Preparing the system for booting

---

# Step 3: POST (Power-On Self-Test)

Before loading the operating system, the firmware performs a diagnostic test called the **Power-On Self-Test (POST)**.

POST verifies that essential hardware is functioning correctly.

Typical checks include:

- CPU
- RAM
- Keyboard
- Graphics hardware
- Storage devices
- Motherboard
- Cooling fans

If a problem is detected, the computer may:

- Display an error message
- Emit beep codes
- Show diagnostic LEDs
- Halt the boot process

For example, if no RAM is installed, the computer cannot continue because it has no working memory.

---

# Step 4: Hardware Initialization

After POST completes successfully, the firmware initializes hardware components so they are ready for use.

Examples include:

- Detecting installed RAM
- Identifying SSDs or HDDs
- Initializing USB ports
- Configuring PCIe devices
- Activating the graphics adapter
- Detecting network interfaces
- Initializing keyboards and mice

At this point, the computer knows which devices are available and how to communicate with them.

---

# Step 5: Selecting the Boot Device

The firmware now looks for a bootable device based on the configured boot order.

Common boot devices include:

1. SSD
2. HDD
3. USB flash drive
4. DVD or Blu-ray drive
5. Network (PXE boot)

If the first device is not bootable, the firmware tries the next one until it finds a valid boot device.

If none are bootable, an error such as **"No Boot Device Found"** or **"Operating System Not Found"** is displayed.

---

# Step 6: Loading the Bootloader

Once a bootable device is found, the firmware loads a small program called the **bootloader**.

The bootloader's job is to load the operating system into RAM.

Examples of bootloaders include:

| Operating System | Bootloader |
|------------------|------------|
| Windows | Windows Boot Manager |
| Linux | GRUB (Grand Unified Bootloader) |
| macOS | Apple Boot Loader |

The bootloader acts as the bridge between the firmware and the operating system.

---

# Step 7: Loading the Operating System

The bootloader loads the operating system's kernel into RAM.

The kernel is the core component of the operating system and is responsible for:

- Managing CPU scheduling
- Managing memory
- Communicating with hardware
- Handling input and output
- Running applications
- Managing files and storage
- Enforcing security and permissions

Once the kernel starts, it initializes device drivers, system services, and background processes.

Finally, the login screen or desktop is displayed, indicating that the system is ready for use.

---

# Boot Process Flow

```text
Power Button Pressed
        │
        ▼
Power Supply Starts
        │
        ▼
CPU Executes BIOS/UEFI
        │
        ▼
POST (Hardware Check)
        │
        ▼
Hardware Initialization
        │
        ▼
Locate Boot Device
        │
        ▼
Load Bootloader
        │
        ▼
Load Operating System Kernel
        │
        ▼
Initialize Drivers & Services
        │
        ▼
Login Screen / Desktop
```

---

# Real-World Example

Imagine turning the key in a car:

- The battery provides power.
- The engine performs initial checks.
- Fuel and ignition systems prepare the engine.
- The engine starts.
- The dashboard becomes active.
- The car is ready to drive.

A computer follows a similar sequence:

- Power is supplied.
- Hardware is checked.
- Firmware prepares the system.
- The bootloader starts.
- The operating system loads.
- The computer becomes ready for use.

---

## Key Takeaways

- Pressing the power button starts the **boot process**.
- The **Power Supply Unit (PSU)** distributes power to all hardware.
- The **CPU** begins by executing **BIOS** or **UEFI** firmware.
- **POST** checks whether essential hardware is working correctly.
- The firmware selects a bootable device.
- A **bootloader** loads the operating system's kernel into RAM.
- The kernel initializes hardware, drivers, and services before presenting the login screen.

# 3. Understanding Binary Data

Although humans communicate using letters, numbers, symbols, images, and sounds, computers understand only **two electrical states**:

- ON
- OFF

These two states are represented using the digits:

```
0
1
```

This numbering system is called the **Binary Number System** (Base-2), and it forms the foundation of all modern computing.

Whether you're typing a document, browsing the internet, watching a video, or playing a game, everything inside the computer is ultimately represented as binary data.

---

# Why Do Computers Use Binary?

Electronic circuits inside a computer are built from billions of tiny switches called **transistors**.

A transistor has only two stable states:

- OFF → 0
- ON → 1

Because these states are easy to distinguish electrically, binary is reliable, fast, and resistant to errors caused by electrical noise.

Using only two states makes it possible for computers to perform billions of operations every second with remarkable accuracy.

---

# What Is a Bit?

A **bit** (short for **binary digit**) is the smallest unit of data in computing.

A bit can store only one of two possible values:

```
0
```

or

```
1
```

Examples:

```
0
1
```

By themselves, bits can represent only two values. To store more complex information, bits are grouped together.

---

# What Is a Byte?

A **byte** consists of **8 bits**.

For example:

```
01000001
```

This group of eight bits is one byte.

A single byte can represent:

- A letter
- A number
- A punctuation mark
- Part of an image
- Part of a sound
- Any other digital information

One byte can represent **256 different values** (from 0 to 255).

---

# Common Data Units

As computers process increasingly large amounts of data, bytes are grouped into larger units.

| Unit | Approximate Size |
|------|------------------:|
| 1 Bit | 0 or 1 |
| 1 Byte (B) | 8 bits |
| 1 Kilobyte (KB) | 1,024 bytes |
| 1 Megabyte (MB) | 1,024 KB |
| 1 Gigabyte (GB) | 1,024 MB |
| 1 Terabyte (TB) | 1,024 GB |
| 1 Petabyte (PB) | 1,024 TB |

> **Note:** In many storage device advertisements, manufacturers use decimal units (1 KB = 1,000 bytes), while operating systems often display sizes using binary-based calculations. This is why the reported storage capacity may appear slightly smaller.

---

# Binary Numbers

Unlike the decimal system (Base-10), which uses digits 0–9, the binary system uses only two digits:

```
0
1
```

Examples:

| Decimal | Binary |
|----------|---------|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| 4 | 0100 |
| 5 | 0101 |
| 6 | 0110 |
| 7 | 0111 |
| 8 | 1000 |

Every larger number can also be represented using combinations of binary digits.

---

# Representing Text

Computers cannot understand letters like:

```
A
B
C
```

Instead, each character is assigned a numeric code.

For example, in the **ASCII** character encoding:

| Character | Decimal | Binary |
|-----------|--------:|---------|
| A | 65 | 01000001 |
| B | 66 | 01000010 |
| C | 67 | 01000011 |

When you type:

```
ABC
```

The computer actually stores:

```
01000001
01000010
01000011
```

---

# Unicode

ASCII works well for English but cannot represent the thousands of characters used in other languages.

To solve this problem, modern systems use **Unicode**, a universal character encoding standard.

Unicode supports characters from languages such as:

- English
- Hindi
- Marathi
- Japanese
- Chinese
- Arabic
- Russian
- Korean
- Emoji 😊

This allows computers worldwide to display and exchange text consistently.

---

# How Images Are Stored

Images are not stored as complete pictures.

Instead, they are made up of tiny dots called **pixels**.

Each pixel stores binary values representing color.

For example:

```
Pixel 1 → Red
Pixel 2 → Green
Pixel 3 → Blue
```

Millions of pixels combine to form the complete image displayed on your screen.

---

# How Audio Is Stored

Sound is also converted into binary data.

A microphone captures sound waves and converts them into digital samples.

These samples are stored as binary values that represent the sound's amplitude at specific points in time.

When played back, the computer converts the binary data into electrical signals that drive speakers or headphones.

---

# How Videos Are Stored

A video is essentially:

- A sequence of images (frames)
- Combined with synchronized audio

Each frame is stored digitally using binary data, and the audio is stored separately. During playback, the computer displays frames rapidly while playing the corresponding audio, creating the illusion of continuous motion.

---

# Real-World Example

Imagine writing the word:

```
Hello
```

Internally, the computer stores it as a series of binary values based on a character encoding such as ASCII or Unicode:

```
H → 01001000
e → 01100101
l → 01101100
l → 01101100
o → 01101111
```

Although you see readable text, the hardware processes only binary digits.

---

# Key Takeaways

- Computers use the **binary number system (Base-2)**.
- A **bit** is the smallest unit of data.
- A **byte** consists of **8 bits**.
- All data—text, images, audio, and video—is represented using binary.
- **ASCII** assigns codes to English characters.
- **Unicode** supports characters from nearly all writing systems and symbols.
- Binary representation enables reliable, high-speed processing by digital hardware.

# 4. CPU Architecture

The **Central Processing Unit (CPU)** is often called the **brain of the computer** because it executes instructions, performs calculations, and coordinates the activities of other hardware components.

Whenever you open an application, browse the internet, edit a document, or play a game, the CPU processes the instructions required to complete those tasks.

Modern CPUs can execute **billions of instructions every second**, making them one of the most important components of any computer.

---

# What Does the CPU Do?

The CPU is responsible for:

- Executing program instructions
- Performing arithmetic calculations
- Performing logical operations
- Controlling the flow of data
- Communicating with RAM and storage
- Managing communication with input and output devices

Almost every operation performed by a computer involves the CPU.

---

# Main Components of a CPU

A CPU is made up of several internal components that work together.

```
                 CPU
      ┌─────────────────────┐
      │                     │
      │   Control Unit      │
      │        (CU)         │
      │                     │
      │ Arithmetic Logic    │
      │      Unit (ALU)     │
      │                     │
      │     Registers       │
      │                     │
      │      Cache          │
      └─────────────────────┘
```

Each component has a specific role in processing instructions.

---

# Control Unit (CU)

The **Control Unit (CU)** directs and coordinates the operations of the CPU.

Its responsibilities include:

- Fetching instructions from memory
- Decoding instructions
- Controlling the execution sequence
- Sending control signals to other components
- Managing data flow between the CPU, RAM, and input/output devices

You can think of the Control Unit as the **traffic controller** of the CPU, ensuring that each component works at the right time.

---

# Arithmetic Logic Unit (ALU)

The **Arithmetic Logic Unit (ALU)** performs mathematical and logical operations.

### Arithmetic Operations

Examples include:

- Addition
- Subtraction
- Multiplication
- Division

Example:

```
25 + 15 = 40
```

### Logical Operations

The ALU also performs logical comparisons, such as:

- Equal to (`==`)
- Greater than (`>`)
- Less than (`<`)
- AND
- OR
- NOT

These operations are essential for decision-making in programs.

For example:

```text
if (age >= 18)
```

The ALU evaluates the comparison to determine whether the condition is true or false.

---

# Registers

**Registers** are very small, extremely fast memory locations located inside the CPU.

They temporarily hold:

- Data currently being processed
- Memory addresses
- Program instructions
- Intermediate calculation results

Because registers are built directly into the CPU, they are much faster than RAM.

Examples of common registers include:

- Program Counter (PC)
- Instruction Register (IR)
- Memory Address Register (MAR)
- Memory Data Register (MDR)
- Accumulator

These registers help the CPU execute instructions efficiently.

---

# Cache Memory

**Cache memory** is a high-speed memory located on or very close to the CPU.

Its purpose is to store frequently accessed data and instructions so the CPU can retrieve them quickly.

Without cache memory, the CPU would have to access RAM much more often, which is significantly slower.

### Cache Levels

Modern processors typically include:

| Cache Level | Description |
|--------------|-------------|
| L1 Cache | Smallest and fastest, dedicated to each CPU core |
| L2 Cache | Larger than L1, slightly slower |
| L3 Cache | Largest cache, usually shared among multiple CPU cores |

The CPU always checks the cache before accessing RAM.

---

# CPU Clock Speed

The CPU performs operations according to an internal clock.

Clock speed is measured in **Hertz (Hz)**.

Common units include:

| Unit | Meaning |
|------|---------|
| MHz | Million cycles per second |
| GHz | Billion cycles per second |

For example:

```
3.5 GHz
```

means the processor can perform approximately **3.5 billion clock cycles every second**.

A higher clock speed often improves performance, but it is not the only factor. CPU architecture, cache size, core count, and software optimization also play significant roles.

---

# CPU Cores

Early computers had a single CPU core, capable of executing one primary instruction stream at a time.

Modern processors contain multiple cores, allowing them to perform many tasks simultaneously.

Common configurations include:

| CPU Type | Number of Cores |
|-----------|----------------:|
| Dual-Core | 2 |
| Quad-Core | 4 |
| Hexa-Core | 6 |
| Octa-Core | 8 |
| 12-Core | 12 |
| 16-Core | 16 |

More cores improve multitasking and performance in applications designed for parallel processing, such as video editing, software development, and gaming.

---

# Threads

Many modern CPUs support **Simultaneous Multithreading (SMT)** or **Hyper-Threading** (Intel's implementation).

This allows each physical core to handle multiple instruction threads concurrently.

For example:

| Physical Cores | Threads |
|---------------:|---------:|
| 4 | 8 |
| 8 | 16 |
| 12 | 24 |

Threads help improve CPU utilization and overall system responsiveness.

---

# CPU Communication with Other Components

The CPU does not work alone. It continuously exchanges data with:

- **RAM** – for active programs and data
- **Storage (SSD/HDD)** – for loading and saving files
- **Graphics Processing Unit (GPU)** – for rendering graphics
- **Input Devices** – such as keyboards and mice
- **Output Devices** – such as monitors and printers

The motherboard's buses provide the communication pathways between these components.

---

# Real-World Analogy

Imagine a restaurant kitchen:

- The **Control Unit (CU)** is the head chef, deciding what should be prepared and in what order.
- The **ALU** is the cook, performing the actual work of preparing dishes.
- **Registers** are the chef's workbench, holding ingredients currently in use.
- **Cache** is a nearby shelf with frequently used ingredients for quick access.
- **RAM** is the pantry where additional ingredients are stored.
- **Storage** is the warehouse where supplies are kept long-term.

Working together, these parts ensure meals are prepared efficiently—just as CPU components work together to execute computer programs.

---

# Key Takeaways

- The CPU is the primary processor responsible for executing instructions.
- The **Control Unit (CU)** manages and coordinates CPU operations.
- The **Arithmetic Logic Unit (ALU)** performs mathematical and logical calculations.
- **Registers** provide extremely fast temporary storage inside the CPU.
- **Cache memory** reduces the time needed to access frequently used data.
- **Clock speed** measures how many cycles the CPU performs each second.
- **Multiple cores and threads** enable modern processors to handle many tasks simultaneously.
- The CPU works continuously with RAM, storage, and input/output devices to execute programs.

# 5. RAM, Motherboard, System Buses, and the Fetch–Decode–Execute Cycle

Now that you understand the CPU's internal architecture, it's time to see how it works together with the rest of the computer. A CPU alone cannot execute programs—it relies on RAM, the motherboard, and communication buses to fetch instructions and data.

These components work together continuously, allowing your computer to execute billions of instructions every second.

---

# Random Access Memory (RAM)

**Random Access Memory (RAM)** is the computer's **temporary working memory**.

Whenever you open a program, edit a document, browse the web, or play a game, the required data is loaded into RAM.

Unlike permanent storage devices such as SSDs or HDDs, RAM loses all of its contents when the computer is turned off.

---

## Why Do We Need RAM?

Imagine trying to cook while repeatedly walking to a warehouse for every ingredient.

Instead, you place the ingredients you currently need on the kitchen counter.

RAM works like that kitchen counter.

Instead of reading data directly from the much slower SSD or HDD every time, the CPU reads and writes data in RAM because it is significantly faster.

---

## Characteristics of RAM

- Temporary (volatile) memory
- Very fast read and write speeds
- Stores currently running programs
- Holds active data while the computer is powered on
- Contents are erased when power is removed

Examples of data stored in RAM:

- Open applications
- Browser tabs
- Active documents
- Running games
- Operating system processes

---

# Storage vs RAM

Many beginners confuse RAM with storage, but they serve different purposes.

| Feature | RAM | SSD / HDD |
|---------|-----|-----------|
| Purpose | Temporary working memory | Permanent data storage |
| Speed | Very Fast | Slower than RAM |
| Volatile | Yes | No |
| Stores | Running programs | Files, applications, operating system |
| Data retained after shutdown | No | Yes |

Think of it this way:

- **RAM** is your desk where you work.
- **Storage** is your filing cabinet where documents are kept permanently.

---

# The Motherboard

The **motherboard** is the main circuit board of the computer.

It connects all hardware components and enables them to communicate.

Components connected to the motherboard include:

- CPU
- RAM
- SSD or HDD
- Graphics card (GPU)
- Network adapter
- USB devices
- Keyboard
- Mouse
- Speakers
- Cooling system

Without the motherboard, these components would not be able to exchange information.

---

# System Buses

A **bus** is a communication pathway that transfers information between computer components.

The CPU, RAM, storage devices, and input/output hardware all communicate using these buses.

There are three primary types of buses.

---

## 1. Data Bus

The **Data Bus** carries the actual data being transferred.

Examples:

- Loading a file from an SSD into RAM
- Sending processed data to the graphics card
- Moving data between RAM and the CPU

---

## 2. Address Bus

The **Address Bus** specifies the memory location where data should be read from or written to.

For example:

```
Read data from memory location 0x1000
```

The address bus tells the system exactly where to find the required information.

---

## 3. Control Bus

The **Control Bus** carries control signals between components.

Examples include:

- Read
- Write
- Interrupt
- Clock synchronization
- Reset

These signals coordinate the timing and direction of data transfers.

---

# How Components Work Together

Suppose you open a web browser.

The sequence looks like this:

1. You double-click the browser icon.
2. The operating system locates the browser on the SSD.
3. The browser program is loaded into RAM.
4. The CPU fetches instructions from RAM.
5. The CPU executes those instructions.
6. The browser window appears on the screen.

This process happens within fractions of a second.

---

# The Fetch–Decode–Execute Cycle

The CPU executes every instruction using a repeating process called the **Fetch–Decode–Execute Cycle**.

This cycle continues as long as the computer is running.

---

## Step 1: Fetch

The CPU fetches the next instruction from RAM.

The instruction is copied into the **Instruction Register (IR)**.

---

## Step 2: Decode

The **Control Unit (CU)** interprets the instruction.

It determines:

- Which operation to perform
- Which data is required
- Which hardware components are involved

---

## Step 3: Execute

The CPU carries out the instruction.

Examples:

- Add two numbers
- Compare values
- Copy data
- Save a file
- Display text
- Play audio

The result is stored in a register, RAM, or sent to an output device.

---

# Fetch–Decode–Execute Flow

```text
RAM
 │
 ▼
Fetch Instruction
 │
 ▼
Decode Instruction
 │
 ▼
Execute Instruction
 │
 ▼
Store Result
 │
 ▼
Fetch Next Instruction
```

This loop repeats continuously, often billions of times every second.

---

# Real-World Example

Imagine calculating:

```
15 + 25
```

The CPU performs the following steps:

1. Fetch the instruction "Add 15 and 25."
2. Decode the instruction to identify it as an addition operation.
3. Execute the addition using the ALU.
4. Store the result (40).
5. Continue with the next instruction.

Even complex software is ultimately broken down into millions of these simple instruction cycles.

---

# Bringing It All Together

The complete flow of a computer processing a task looks like this:

```text
User Input
      │
      ▼
Input Device
      │
      ▼
Operating System
      │
      ▼
Storage (SSD/HDD)
      │
      ▼
RAM
      │
      ▼
CPU
(Fetch → Decode → Execute)
      │
      ▼
Processed Data
      │
      ▼
Output Device
```

Whether you're typing a document, compiling code, editing photos, or watching a movie, the computer follows this same fundamental workflow.

---

# Lesson Summary

In this lesson, you learned:

- What happens when a computer starts.
- How BIOS/UEFI and the boot process prepare the system.
- Why computers use binary numbers.
- How text, images, audio, and video are represented digitally.
- The architecture of the CPU.
- The roles of the Control Unit, ALU, registers, and cache.
- The difference between RAM and permanent storage.
- How the motherboard connects hardware components.
- The purpose of the Data Bus, Address Bus, and Control Bus.
- How the Fetch–Decode–Execute Cycle allows the CPU to execute every instruction.

Understanding these concepts provides a strong foundation for learning operating systems, programming, networking, cybersecurity, and computer architecture.

---

# Key Terms

- Binary
- Bit
- Byte
- CPU
- Control Unit (CU)
- Arithmetic Logic Unit (ALU)
- Register
- Cache Memory
- RAM
- Motherboard
- Data Bus
- Address Bus
- Control Bus
- BIOS
- UEFI
- Bootloader
- Kernel
- Fetch–Decode–Execute Cycle

---

# Interview Questions

1. What is the role of the CPU in a computer?
2. Why do computers use binary instead of decimal?
3. What is the difference between RAM and SSD?
4. What happens during the boot process?
5. What is BIOS, and how is it different from UEFI?
6. What are registers, and why are they important?
7. What is cache memory, and how does it improve performance?
8. What are the three types of system buses?
9. Explain the Fetch–Decode–Execute Cycle.
10. Describe how a program is loaded and executed after you double-click its icon.
