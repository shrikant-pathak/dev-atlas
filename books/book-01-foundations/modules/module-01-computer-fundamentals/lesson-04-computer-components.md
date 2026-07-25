# Lesson 04 – Computer Components

---

# Learning Objectives

After completing this lesson, you will be able to:

- Explain what computer components are.
- Differentiate between internal and external hardware.
- Describe the purpose of each major hardware component.
- Explain how computer components work together.
- Identify the major components inside a computer cabinet.
- Understand the basic architecture of a computer system.

---

# Introduction

Every computer, whether it is a desktop, laptop, smartphone, server, or supercomputer, is made up of several hardware components that work together to perform tasks.

Each component has a specific responsibility. Some components process information, some store data, while others allow users to interact with the computer.

Imagine a computer as a team of specialists working together:

- The CPU makes decisions.
- RAM temporarily stores active data.
- Storage permanently saves files.
- The motherboard connects every component.
- Input devices receive user commands.
- Output devices display results.

If any major component fails, the computer may not function correctly.

Understanding these components is the foundation for learning computer architecture, operating systems, networking, programming, cybersecurity, and hardware troubleshooting.

---

# What Are Computer Components?

Computer components are the physical parts (hardware) and supporting firmware that together make a computer system work.

Each component performs a specific task, but they must communicate continuously to execute programs successfully.

For example:

- When you type on a keyboard, the input device sends signals to the CPU.
- The CPU processes the information.
- RAM temporarily stores the data while the program is running.
- The storage device permanently saves the file.
- The monitor displays the final result.

This entire process usually happens within milliseconds.

---

# Categories of Computer Components

Computer components can be grouped into two major categories.

## 1. Internal Components

These are located inside the computer case.

Examples include:

- Motherboard
- CPU (Processor)
- RAM
- ROM
- Hard Disk Drive (HDD)
- Solid State Drive (SSD)
- Graphics Processing Unit (GPU)
- Power Supply Unit (PSU)
- Cooling System
- Expansion Cards
- CMOS Battery

These components cannot normally be accessed without opening the computer cabinet.

---

## 2. External Components (Peripherals)

External components connect to the computer from the outside.

Examples include:

### Input Devices

- Keyboard
- Mouse
- Scanner
- Webcam
- Microphone
- Touchscreen

### Output Devices

- Monitor
- Printer
- Speakers
- Projector
- Headphones

### Storage Devices

- USB Flash Drive
- External Hard Drive
- Memory Card

These devices communicate with the computer through ports such as USB, HDMI, Ethernet, and audio connectors.

---

# Internal Layout of a Desktop Computer

A typical desktop computer contains the following major components:

```
+-------------------------------------------+
|               Computer Case               |
|                                           |
|  +-----------------------------------+    |
|  |          Motherboard              |    |
|  |                                   |    |
|  |  CPU      RAM Slots               |    |
|  |                                   |    |
|  |  GPU      Expansion Slots         |    |
|  |                                   |    |
|  +-----------------------------------+    |
|                                           |
| SSD / HDD                                |
|                                           |
| Power Supply Unit (PSU)                  |
|                                           |
| Cooling Fans                             |
+-------------------------------------------+
```

Although laptops, tablets, and smartphones have different physical designs, they contain equivalent hardware components integrated into a smaller space.

---

# How Computer Components Work Together

Every time you use a computer, its components cooperate in a sequence.

For example, when you save a document:

1. You type using the keyboard.
2. The keyboard sends input to the CPU.
3. The CPU processes your commands.
4. RAM temporarily stores the document while you edit it.
5. The SSD or HDD permanently saves the file.
6. The monitor displays the saved document.

This continuous communication allows computers to execute billions of operations accurately and efficiently.

---

# Main Components Covered in This Lesson

In the following sections, we will study each component in detail:

- Motherboard
- CPU (Central Processing Unit)
- RAM
- ROM
- Cache Memory
- Storage Devices
- GPU
- Power Supply Unit
- Cooling System
- BIOS and UEFI
- CMOS Battery
- Expansion Cards
- Computer Ports
- Data Buses

By understanding the role of each component, you'll gain a clear picture of how a modern computer functions internally.

# Motherboard

The **Motherboard** is the main circuit board of a computer.

It is often called the **backbone** or **heart of the computer** because every major hardware component is connected to it.

The motherboard allows all components to communicate with one another through electrical pathways called **buses**.

Without a motherboard, the CPU, RAM, storage devices, graphics card, and other hardware would not be able to work together.

---

# Functions of the Motherboard

The motherboard performs several important functions:

- Connects all hardware components.
- Enables communication between devices.
- Distributes electrical power to components.
- Houses the CPU and memory.
- Provides expansion slots.
- Supports storage devices.
- Connects external ports.
- Contains firmware (BIOS/UEFI).

---

# Major Parts of a Motherboard

A modern motherboard contains several important sections.

```
+-----------------------------------------------------+
|                     Motherboard                     |
|                                                     |
|  CPU Socket        RAM Slots                        |
|                                                     |
|  Chipset           M.2 SSD Slot                     |
|                                                     |
|  PCIe Slots        SATA Connectors                  |
|                                                     |
|  BIOS Chip         CMOS Battery                     |
|                                                     |
|  USB Headers       Fan Headers                      |
|                                                     |
|  Power Connectors                                I/O|
+-----------------------------------------------------+
```

---

# CPU Socket

The **CPU Socket** is where the processor is installed.

The socket provides electrical connections between the CPU and the motherboard.

Different processors require different socket types.

Examples include:

- Intel LGA series
- AMD AM series

A processor can only be installed in a compatible socket.

---

# RAM Slots

RAM modules are installed into dedicated **DIMM slots** on the motherboard.

Modern motherboards usually provide:

- Two RAM slots
- Four RAM slots
- Eight RAM slots (workstations and servers)

Installing RAM correctly allows the CPU to access working memory efficiently.

---

# Chipset

The **chipset** controls communication between the CPU and other hardware components.

It determines:

- Supported processors
- Maximum RAM capacity
- Number of PCIe lanes
- Storage support
- USB support
- Expansion capabilities

Modern processors integrate many chipset functions directly into the CPU, improving performance.

---

# Expansion Slots

Expansion slots allow additional hardware to be installed.

Common expansion cards include:

- Graphics cards
- Wi-Fi adapters
- Sound cards
- Capture cards
- Network interface cards (NICs)

Most modern expansion slots use the **PCI Express (PCIe)** standard.

---

# Storage Connectors

Motherboards provide connectors for storage devices.

Common interfaces include:

- SATA (for HDDs and SATA SSDs)
- M.2 (for NVMe SSDs)

These connectors allow the operating system and user data to be stored permanently.

---

# Power Connectors

The motherboard receives electrical power from the **Power Supply Unit (PSU)**.

Important connectors include:

- 24-pin motherboard connector
- 8-pin CPU power connector

These supply stable power to the system.

---

# BIOS / UEFI Chip

Every motherboard contains firmware stored on a dedicated chip.

This firmware:

- Starts the computer.
- Detects hardware.
- Performs hardware checks.
- Loads the operating system.

Modern systems use **UEFI**, which replaces the older BIOS in most computers.

---

# CMOS Battery

The small coin-cell battery on the motherboard powers the CMOS memory.

It stores:

- Date
- Time
- BIOS/UEFI settings

If the battery fails, the computer may lose these settings when powered off.

---

# Rear I/O Ports

The rear panel of the motherboard provides connectors for external devices.

Common ports include:

- USB
- HDMI
- DisplayPort
- Ethernet (LAN)
- Audio ports
- PS/2 (older systems)

These ports allow communication with peripherals.

---

# What Happens When You Press the Power Button?

The startup process follows a sequence:

1. The PSU supplies power.
2. The motherboard activates.
3. BIOS/UEFI starts.
4. Hardware is checked (POST).
5. The CPU begins executing firmware.
6. Storage devices are detected.
7. The operating system loads.
8. The login screen appears.

This process typically takes only a few seconds.

---

# Central Processing Unit (CPU)

The **Central Processing Unit (CPU)** is often called the **brain of the computer**.

It performs calculations, makes logical decisions, and executes instructions from software.

Every application you use depends on the CPU.

Whether you are browsing the web, editing documents, compiling code, or playing games, the CPU processes millions—or even billions—of instructions every second.

---

# Functions of the CPU

The CPU is responsible for:

- Executing program instructions.
- Performing arithmetic calculations.
- Making logical comparisons.
- Controlling data flow.
- Managing communication between hardware components.
- Coordinating overall system operations.

---

# Main Parts of a CPU

A CPU contains several important internal components.

```
           +----------------------+
           |         CPU          |
           |                      |
           |  Control Unit (CU)   |
           |                      |
           |  ALU                 |
           |                      |
           |  Registers           |
           |                      |
           |  Cache Memory        |
           +----------------------+
```

---

# Control Unit (CU)

The **Control Unit (CU)** directs the operation of the processor.

Its responsibilities include:

- Fetching instructions from memory.
- Decoding instructions.
- Coordinating data movement.
- Controlling communication between components.

Think of the Control Unit as a traffic controller that ensures every component performs its task at the correct time.

---

# Arithmetic Logic Unit (ALU)

The **Arithmetic Logic Unit (ALU)** performs mathematical and logical operations.

Arithmetic operations include:

- Addition
- Subtraction
- Multiplication
- Division

Logical operations include:

- AND
- OR
- NOT
- XOR
- Greater than
- Less than
- Equal to

Almost every program depends on these operations.

---

# Registers

Registers are the **fastest memory locations** inside the CPU.

They temporarily hold:

- Instructions
- Memory addresses
- Intermediate calculation results
- Data currently being processed

Registers are much faster than RAM but have a very limited capacity.

---

# Cache Memory

Cache memory is a small, high-speed memory located inside or very close to the CPU.

It stores frequently used data and instructions so the processor can access them more quickly than retrieving them from RAM.

Modern CPUs commonly include:

- L1 Cache (fastest, smallest)
- L2 Cache
- L3 Cache (largest, shared among cores)

Using cache significantly improves overall system performance.

---

# CPU Clock Speed

The CPU performs operations according to its clock speed.

Clock speed is measured in:

- Megahertz (MHz)
- Gigahertz (GHz)

For example:

- 3.2 GHz
- 4.5 GHz
- 5.0 GHz

A higher clock speed generally allows the processor to execute more instructions per second, though overall performance also depends on architecture, core count, and cache size.

---

# CPU Cores

Modern processors contain multiple processing cores.

Common configurations include:

- Dual-core
- Quad-core
- Hexa-core
- Octa-core
- 12-core
- 16-core
- 24-core and beyond

Multiple cores enable the CPU to perform many tasks simultaneously, improving multitasking and performance for demanding applications.

---

# Hyper-Threading / Simultaneous Multithreading (SMT)

Some processors support technologies that allow each physical core to handle more than one execution thread.

Benefits include:

- Better multitasking
- Improved resource utilisation
- Faster performance in supported workloads

Intel refers to this as **Hyper-Threading**, while AMD uses the term **Simultaneous Multithreading (SMT)**.

---

# The CPU Instruction Cycle

The CPU repeatedly follows a four-step cycle:

```
Fetch
   ↓
Decode
   ↓
Execute
   ↓
Store Result
```

This cycle occurs billions of times every second while the computer is running.

---

# Chapter Checkpoint

At this stage, you should be able to:

- Explain the purpose of the motherboard.
- Identify the major sections of a motherboard.
- Describe the role of the CPU.
- Explain the functions of the Control Unit, ALU, registers, and cache memory.
- Understand the fetch–decode–execute cycle.

# Random Access Memory (RAM)

**Random Access Memory (RAM)** is the computer's **temporary working memory**.

Whenever you open an application, edit a document, browse the Internet, or play a game, the required data is first loaded into RAM so that the CPU can access it quickly.

RAM is called **volatile memory** because its contents are erased when the computer is turned off or restarted.

---

# Functions of RAM

RAM performs several important functions.

- Temporarily stores running programs.
- Holds data currently being processed.
- Provides fast access to frequently used information.
- Improves overall system performance.
- Supports multitasking.

Without sufficient RAM, a computer becomes slow because it must constantly retrieve data from much slower storage devices.

---

# Characteristics of RAM

- Very fast.
- Temporary storage.
- Volatile memory.
- Read and write operations are supported.
- Installed directly on the motherboard.
- Measured in gigabytes (GB).

Common capacities include:

- 4 GB
- 8 GB
- 16 GB
- 32 GB
- 64 GB
- 128 GB and higher

---

# Types of RAM

Modern computers mainly use:

## DRAM (Dynamic RAM)

- Most common type.
- Requires continuous refreshing.
- Used as the primary system memory.

---

## SRAM (Static RAM)

- Faster than DRAM.
- More expensive.
- Used mainly for CPU cache memory.

---

## DDR Memory Generations

Modern computers use different generations of DDR memory.

- DDR3
- DDR4
- DDR5

Each generation offers higher speed, lower power consumption, and better performance than the previous one.

---

# Read Only Memory (ROM)

**Read Only Memory (ROM)** is permanent memory that stores essential startup instructions for the computer.

Unlike RAM, ROM retains its contents even when the computer is switched off.

The firmware stored in ROM helps the computer begin the boot process.

---

# Characteristics of ROM

- Non-volatile.
- Permanent storage.
- Stores firmware.
- Smaller capacity than RAM.
- Rarely modified.

---

# RAM vs ROM

| Feature | RAM | ROM |
|----------|-----|-----|
| Data Retention | Temporary | Permanent |
| Volatile | Yes | No |
| Read/Write | Yes | Mostly Read |
| Speed | Very Fast | Slower than RAM |
| Purpose | Running Programs | Startup Firmware |

---

# Storage Devices

Storage devices permanently save operating systems, applications, and user files.

Unlike RAM, storage retains data even after power is turned off.

There are three major storage technologies used today.

- Hard Disk Drive (HDD)
- Solid State Drive (SSD)
- NVMe SSD

---

# Hard Disk Drive (HDD)

An **HDD** stores data on rapidly spinning magnetic disks called **platters**.

A moving read/write head accesses the data.

---

## Characteristics

- Large storage capacity.
- Lower cost.
- Mechanical parts.
- Slower than SSDs.
- More vulnerable to physical damage.

---

## Common Capacities

- 500 GB
- 1 TB
- 2 TB
- 4 TB
- 8 TB+

---

# Solid State Drive (SSD)

An **SSD** stores data using flash memory instead of moving mechanical parts.

This makes SSDs much faster and more reliable than HDDs.

---

## Advantages

- Very fast.
- Silent operation.
- Lower power consumption.
- Shock resistant.
- Faster boot times.
- Faster application loading.

---

# NVMe SSD

**NVMe (Non-Volatile Memory Express)** is a high-speed storage technology that communicates directly with the motherboard through PCI Express (PCIe).

Compared with traditional SATA SSDs, NVMe drives offer significantly higher data transfer speeds.

They are commonly used in modern laptops, gaming systems, and professional workstations.

---

# HDD vs SSD vs NVMe

| Feature | HDD | SATA SSD | NVMe SSD |
|----------|-----|----------|-----------|
| Speed | Slow | Fast | Very Fast |
| Moving Parts | Yes | No | No |
| Noise | Yes | No | No |
| Reliability | Moderate | High | High |
| Cost | Lowest | Medium | Highest |
| Best For | Large Storage | Everyday Computing | High Performance |

---

# Graphics Processing Unit (GPU)

The **Graphics Processing Unit (GPU)** is responsible for rendering graphics, videos, animations, and visual effects.

Originally designed for graphics, modern GPUs also accelerate artificial intelligence, machine learning, scientific computing, and cryptocurrency calculations.

---

# Types of GPU

## Integrated GPU

- Built into the CPU.
- Lower power consumption.
- Suitable for office work and multimedia.

---

## Dedicated GPU

- Separate hardware component.
- Own video memory (VRAM).
- High graphics performance.
- Used for gaming, CAD, AI, and video editing.

---

# GPU Applications

- Gaming
- 3D Modelling
- Video Editing
- Artificial Intelligence
- Machine Learning
- Scientific Simulations
- Animation
- Virtual Reality

---

# Power Supply Unit (PSU)

The **Power Supply Unit (PSU)** converts alternating current (AC) from the wall outlet into low-voltage direct current (DC) used by computer components.

Without a PSU, none of the internal hardware can operate.

---

# Functions

The PSU supplies stable power to:

- Motherboard
- CPU
- RAM
- GPU
- Storage Devices
- Cooling Fans
- Expansion Cards

---

# PSU Ratings

PSUs are commonly available in capacities such as:

- 450 W
- 550 W
- 650 W
- 750 W
- 850 W
- 1000 W+

Higher-performance computers generally require higher-capacity PSUs.

---

# Cooling Systems

Computer components generate heat while operating.

If heat is not removed efficiently, performance decreases and hardware may be damaged.

Cooling systems maintain safe operating temperatures.

---

# Types of Cooling

## Air Cooling

Uses:

- Heat sinks
- Cooling fans

Most personal computers use air cooling.

---

## Liquid Cooling

Uses coolant to transfer heat away from the CPU or GPU.

Often found in:

- Gaming PCs
- Professional workstations
- High-performance servers

---

# BIOS and UEFI

When a computer starts, the firmware stored on the motherboard is the first software that runs.

Older computers use **BIOS (Basic Input/Output System)**.

Most modern computers use **UEFI (Unified Extensible Firmware Interface)**.

---

# Responsibilities

BIOS/UEFI:

- Detects hardware.
- Performs POST (Power-On Self-Test).
- Initialises system components.
- Loads the operating system.
- Allows hardware configuration.

UEFI provides a modern graphical interface, faster boot times, and support for larger storage devices.

---

# CMOS Battery

The CMOS battery is a small coin-cell battery installed on the motherboard.

Its purpose is to preserve:

- System date
- System time
- BIOS/UEFI settings

If the battery becomes depleted, these settings may reset when the computer loses power.

---

# Expansion Cards

Expansion cards add extra functionality to a computer.

They are installed in PCI Express (PCIe) slots on the motherboard.

Examples include:

- Graphics Cards
- Network Cards
- Sound Cards
- Capture Cards
- RAID Controllers
- USB Expansion Cards

Expansion cards allow users to upgrade a computer without replacing the motherboard.

---

# Chapter Checkpoint

You should now be able to:

- Explain the role of RAM and ROM.
- Compare HDDs, SSDs, and NVMe drives.
- Describe the purpose of a GPU.
- Explain how the PSU powers a computer.
- Understand why cooling systems are essential.
- Describe the functions of BIOS/UEFI and the CMOS battery.
- Identify common expansion cards and their uses.


# Computer Ports and Connectors

Computer components communicate with external devices through **ports**.

A port is a physical interface that allows data, video, audio, or power to be transferred between the computer and another device.

---

# Common Computer Ports

## USB (Universal Serial Bus)

USB is the most widely used computer port.

It is used to connect:

- Keyboard
- Mouse
- Printer
- Flash Drive
- Smartphone
- External Hard Disk
- Webcam

Modern USB versions include:

- USB 2.0
- USB 3.0
- USB 3.1
- USB 3.2
- USB4

---

## HDMI (High-Definition Multimedia Interface)

HDMI transmits:

- Video
- Audio

It is commonly used to connect:

- Monitor
- Television
- Projector

---

## DisplayPort

DisplayPort is a digital display interface commonly used for:

- High-resolution monitors
- Gaming displays
- Professional graphics workstations

---

## Ethernet Port (RJ-45)

The Ethernet port connects a computer to a wired network.

Advantages include:

- Stable Internet connection
- High speed
- Low latency
- Reliable communication

---

## Audio Ports

Audio ports connect:

- Speakers
- Headphones
- Microphones

Many modern laptops also support audio through USB-C.

---

## USB Type-C

USB-C is becoming the standard connector for modern devices.

Advantages:

- Reversible connector
- High-speed data transfer
- Video output
- Charging support
- Single cable for multiple purposes

---

# Computer Buses

A **bus** is a communication pathway that transfers information between computer components.

Without buses, the CPU, RAM, storage devices, and peripherals could not exchange data.

---

# Types of Buses

## Data Bus

Transfers actual data.

Example:

RAM → CPU

---

## Address Bus

Carries memory addresses.

The CPU uses the address bus to specify where data should be read from or written to.

---

## Control Bus

Carries control signals.

Examples include:

- Read
- Write
- Interrupt
- Reset
- Clock signals

Together, these buses coordinate communication throughout the computer.

---

# How All Components Work Together

Let's follow what happens when you save a document.

### Step 1

You type on the keyboard.

↓

### Step 2

The keyboard sends input to the motherboard.

↓

### Step 3

The CPU processes the information.

↓

### Step 4

RAM temporarily stores the active document.

↓

### Step 5

The storage device permanently saves the file.

↓

### Step 6

The monitor displays the updated document.

This entire process happens in milliseconds.

---

# Complete Computer Workflow

```
User
   │
   ▼
Keyboard / Mouse
   │
   ▼
Motherboard
   │
   ▼
CPU
   │
   ├────────► RAM
   │
   ├────────► GPU
   │
   ├────────► Storage
   │
   ▼
Monitor
```

Every major hardware component works together continuously while the computer is running.

---

# Characteristics of Good Computer Hardware

Reliable hardware should provide:

- High performance
- Low power consumption
- Good cooling
- High reliability
- Easy upgradeability
- Compatibility with other components

---

# Common Hardware Problems

Some frequently encountered hardware issues include:

- Computer does not power on
- Blue Screen of Death (BSOD)
- Overheating
- Slow performance
- Faulty RAM
- Hard drive failure
- PSU failure
- Loose cables
- GPU overheating
- Fan failure

Regular maintenance can prevent many of these problems.

---

# Basic Troubleshooting Tips

When a computer has hardware issues:

1. Check power connections.
2. Verify all cables are securely connected.
3. Listen for beep codes.
4. Inspect RAM installation.
5. Check CPU temperatures.
6. Confirm storage detection in BIOS/UEFI.
7. Update firmware when appropriate.
8. Replace faulty components if required.

---

# Comparison of Major Components

| Component | Main Function |
|-----------|---------------|
| Motherboard | Connects all hardware |
| CPU | Processes instructions |
| RAM | Temporary working memory |
| ROM | Stores startup firmware |
| HDD/SSD | Permanent storage |
| GPU | Processes graphics |
| PSU | Supplies electrical power |
| Cooling System | Removes heat |
| BIOS/UEFI | Starts the computer |
| CMOS Battery | Stores firmware settings |
| Expansion Card | Adds new functionality |

---

# Frequently Asked Questions (FAQ)

## Why is the CPU called the brain of the computer?

Because it performs calculations, executes instructions, and coordinates nearly every operation inside the computer.

---

## Why is RAM temporary?

RAM is volatile memory. Its contents are lost when electrical power is removed.

---

## Which storage device is faster?

NVMe SSDs are generally faster than SATA SSDs, which are significantly faster than HDDs.

---

## Can a computer run without RAM?

No.

Without RAM, the CPU has no working memory to execute programs.

---

## Can a computer run without storage?

Only in specialised environments such as network booting.

For normal everyday use, a storage device containing the operating system is required.

---

## What happens if the CPU overheats?

The system may:

- Slow down (thermal throttling)
- Restart unexpectedly
- Shut down automatically
- Suffer hardware damage if overheating persists

---

# Lesson Summary

In this lesson, you learned about the major internal hardware components of a computer and how they work together.

You explored:

- Motherboard
- CPU
- RAM
- ROM
- Storage devices
- GPU
- Power Supply Unit
- Cooling systems
- BIOS/UEFI
- CMOS battery
- Expansion cards
- Ports
- Data buses

Understanding these components provides the foundation for learning operating systems, programming, networking, cybersecurity, and computer repair.

---

# Key Takeaways

After completing this lesson, you should be able to:

- Identify every major computer component.
- Explain the purpose of each component.
- Describe how hardware components communicate.
- Compare RAM, ROM, HDD, SSD, and NVMe storage.
- Understand the computer startup process.
- Explain the role of BIOS/UEFI.
- Identify common ports and connectors.
- Perform basic hardware troubleshooting.

---

# Quiz

## Multiple Choice Questions

### 1. Which component is called the brain of the computer?

A. RAM

B. Motherboard

C. CPU

D. SSD

**Answer:** C

---

### 2. Which component stores temporary data?

A. HDD

B. ROM

C. RAM

D. SSD

**Answer:** C

---

### 3. Which component permanently stores files?

A. RAM

B. CPU

C. SSD/HDD

D. Cache

**Answer:** C

---

### 4. Which component connects every internal device?

A. GPU

B. Motherboard

C. PSU

D. RAM

**Answer:** B

---

### 5. Which component converts AC power into DC power?

A. CPU

B. PSU

C. GPU

D. ROM

**Answer:** B

---

### 6. Which firmware starts the computer?

A. RAM

B. BIOS/UEFI

C. SSD

D. GPU

**Answer:** B

---

### 7. Which bus carries memory addresses?

A. Data Bus

B. Address Bus

C. USB Bus

D. Control Bus

**Answer:** B

---

### 8. Which component processes graphics?

A. CPU

B. GPU

C. PSU

D. HDD

**Answer:** B

---

### 9. Which battery stores BIOS settings?

A. Lithium Battery

B. CMOS Battery

C. UPS Battery

D. Laptop Battery

**Answer:** B

---

### 10. Which port is commonly used to connect modern monitors?

A. HDMI

B. Ethernet

C. Audio Jack

D. PS/2

**Answer:** A

---

# Practical Exercises

## Exercise 1

Open a desktop computer (or view a labelled diagram) and identify:

- Motherboard
- CPU
- RAM
- SSD/HDD
- PSU
- GPU
- Cooling Fan

---

## Exercise 2

Create a comparison table for:

- RAM
- ROM
- HDD
- SSD
- NVMe SSD

Compare:

- Speed
- Capacity
- Cost
- Purpose
- Volatility

---

## Exercise 3

Draw a block diagram showing how data flows from:

**Keyboard → CPU → RAM → Storage → Monitor**

Label each component clearly.

---

## Exercise 4

Research the hardware specifications of your own computer and record:

- CPU model
- RAM size
- Storage type
- GPU
- Motherboard (if available)
- Operating system

---

# Mini Project

## Build a Computer Hardware Guide

Create a reference guide containing:

- Diagram of a motherboard
- Description of each hardware component
- Comparison tables
- Images of common ports
- Data flow diagram
- Troubleshooting checklist

Present the guide in Markdown, PowerPoint, Canva, or PDF.

---

# Interview Questions

## Basic

1. What is the motherboard?
2. What is the function of the CPU?
3. What is RAM?
4. What is ROM?
5. What is BIOS?
6. What is UEFI?
7. What is the purpose of a PSU?
8. What is a GPU?
9. What is an SSD?
10. What is an expansion card?

---

## Intermediate

1. Explain the fetch–decode–execute cycle.
2. Compare HDD, SSD, and NVMe storage.
3. Describe how a motherboard connects hardware components.
4. Explain the differences between RAM and ROM.
5. How do buses enable communication inside a computer?

---

# What's Next?

In **Lesson 05 – Hardware vs Software**, you'll learn:

- What hardware is
- What software is
- Types of software
- System software
- Application software
- Utility software
- Firmware
- Hardware–software interaction
- Real-world examples
- Comparison tables
- Practical exercises
- Quiz and interview questions

This lesson will bridge your understanding of physical computer components with the software that makes them useful.

---

# Congratulations!

🎉 You have successfully completed **Lesson 04 – Computer Components**.

You now understand the major hardware components of a computer, their functions, how they communicate, and how they work together to execute programs.

This knowledge forms the foundation for nearly every topic you'll study later in computer science and software development.

---

**End of `lesson-04-computer-components.md`**