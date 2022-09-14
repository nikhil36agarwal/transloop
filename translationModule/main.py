from googletrans import Translator
import PyPDF2
import gtts
from playsound import playsound
import os

pdfFileObj = open('chanakya-niti.pdf', 'rb')

pdfReader = PyPDF2.PdfFileReader(pdfFileObj)

print("Number of pages in the pdf : ")
print(pdfReader.numPages)

pageObj = pdfReader.getPage(0)
print(">>>Here is the extract from the pdf : ")
print("\n")
print(pageObj.extractText())

with open("extracted.txt", "w") as file:
    file.write(pageObj.extractText())

translator = Translator()
result = translator.translate(pageObj.extractText(), src='en', dest='hi')

print("\n")
print(">>>Translated Text: ")
print(result.text)

with open("translated.txt", "w", encoding='utf-8') as file:
    file.write(result.text)

# The text that we want to convert to audio
extrtxt = result.text

# Language in which we want to convert
# txtLang = 'en'

# Passing the audio to engine
# Yaha, 'False' matlab audio having high speed

spchObj = gtts.gTTS(text=extrtxt, lang='en', slow=False)

# Saving the converted audio
spchObj.save("speech.mp3")
# Playing the converted file
playsound("speech.mp3")

# Releasing memory : -
pdfFileObj.close()



