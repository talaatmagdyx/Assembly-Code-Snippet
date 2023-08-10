# Assembly Code Snippet


![gitbook](https://2775338190-files.gitbook.io/~/files/v0/b/gitbook-x-prod.appspot.com/o/spaces%2FNkEGS7hzeqa35sMXQZ4X%2Flogo%2FOuhJtvIHKdHaX2i4srID%2FGitBook.svg?alt=media&token=037f9094-63cd-4222-8bbf-bc3ca7e13cf1)

I had a wonderful experience exploring GitBook. If you're interested in delving into this repository like reading a book, you can access it through the following link: **[Assembly Code Snippet](https://talaatmagdyx.gitbook.io/assembly-code-snippet/)**.

**Creating Linux Executables from NASM Source Code**

**(NASM)**, a versatile assembler and disassembler, is a vital tool for Intel x86 architecture programming. It's widely adopted for crafting programs in 16-bit, 32-bit (IA-32), and 64-bit (x86-64) formats. This guide focuses on creating Linux executables from NASM source code. The process involves translating low-level mnemonics into machine language, understandable by processors.

## **Steps to Create Executable:**

### **Step 1: Source File Creation**

1. Open your preferred text editor (e.g., Sublime, Atom, KWrite, XEmacs).
2. Compose your NASM source code.
3. Save the file with the `.asm` extension.

### **Step 2: Assemble Source File**

1. Ensure NASM is installed on your machine.
2. If on Debian or Ubuntu, install with:

   ```bash
   sudo apt-get install nasm
   ```

3. For other Linux distros, use your package manager (e.g., Urpmi, Yum, Emerge) or get NASM from the official site.
4. Assemble your source file using:

   ```bash
   nasm -f elf file.asm
   ```

   This creates `file.o` (object file) in the current directory.

### **Step 3: Create Executable**

1. With the `file.o` object file, two cases exist:

   **Case 1:** Program begins with `_start` procedure (no main function):

   ```bash
   ld file.o -o file
   ```

   **Case 2:** Program begins with `main` procedure:

   ```bash
   gcc file.o -o file
   ```

   (*Note: Repository optimized for Case 1*)

   The executable is now created and resides in the current directory.

### **Step 4: Execute Program**

1. To run the program named "test," use:

   ```bash
   ./file
   ```

## **Readme File Additions:**

### **Linux Executable Creation with NASM**

This guide outlines the steps to create Linux executables from NASM source code. NASM, serving as an assembler and disassembler for Intel x86 architecture, facilitates the translation of mnemonics into machine language.

### **Usage Instructions:**

1. **Source File Creation:**
   - Open your preferred text editor.
   - Write your NASM source code.
   - Save the file with a `.asm` extension.

2. **Assemble Source File:**
   - Ensure NASM is installed. For Debian/Ubuntu, use `sudo apt-get install nasm`.
   - Install NASM using your distro's package manager or from the official site.
   - Assemble the source file with `nasm -f elf file.asm`.

3. **Create Executable:**
   - For programs starting with `_start`, create an executable with `ld file.o -o file`.
   - For programs starting with `main`, use `gcc file.o -o file`.

4. **Execute Program:**
   - Run the executable with `./file`.

This process simplifies the creation of Linux executables from NASM source code, providing you with functional programs for your Intel x86 architecture projects.

### reference 
**[Assembly Code Snippet](https://github.com/talaatmagdyx/Assembly-Code-Snippet)**

[Assembly Repository](https://github.com/talaatmagdyx/Assembly)
