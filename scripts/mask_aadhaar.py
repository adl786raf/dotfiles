import re
import sys

def mask_aadhaar(number):
    clean_number = re.sub(r'[\s-]', '', number)
    
    if len(clean_number) != 12 or not clean_number.isdigit():
        print("❌ Error: Aadhaar must be exactly 12 digits.")
        return

    masked = "XXXX-XXXX-" + clean_number[-4:]
    print(f"\n✅ Masked Number: \033[1;32m{masked}\033[0m")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        mask_aadhaar(sys.argv[1])
    else:
        num = input("Enter 12-digit Aadhaar number: ")
        mask_aadhaar(num)
