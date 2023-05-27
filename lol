from aiogram import Bot, Dispatcher, executor
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InputFile, InlineKeyboardMarkup

API_TOKEN = "5811603538:AAHIQazM-xRxKKnFIuh2rumE1AGvOFCZDe0"

bot = Bot(token = API_TOKEN)
dp = Dispatcher(bot)

btns_main = [
    [KeyboardButton('Цена жизни в России')],
    [KeyboardButton('О нас')],
    [KeyboardButton('Лучшее видео')]
]



kb_main = ReplyKeyboardMarkup(keyboard=btns_main, resize_keyboard=True)
'''
kb_btns_models = []
for key in iphones:
    btn = [KeyboardButton(text=key, callback_data = key)]
    kb_btns_models.append(btn)
kb_models = InlineKeyboardMarkup(inline_keyboard=kb_btns_models)
'''
async def echo_handler(message):
    if message.text != "Цена жизни в России" and "О нас" and 'Лучшее видео':
        await bot.send_photo(message.from_user.id, photo = open("xz.jpg", "rb"))

async def start_handler(message):
    #for i in range(2):
    await message.answer("госуслуги приветствуют!", reply_markup=kb_main)




async def price_handler(message):
    await message.answer("налог на воздух - 100000000$", reply_markup=kb_main)


async def help_handler(message):
    await message.answer("хахпхахп, бот")

async def lovely_video(message):
    # await bot.send_video(message.from_user.id, video = open("shirokiy-putin-idet.mp4", "rb"), supports_streaming=True)
    await bot.send_video(message.from_user.id, video=InputFile(path_or_bytesio="shirokiy-putin-idet.mp4"), parse_mode="HTML")
'''
async def show_price_handler(callback):
    price = iphones[callback.data]
    await callback.message.answer(price)
'''

async def learnUs_handler(message):
    await message.answer("а что непонятно иди работай", reply_markup=kb_main)



dp.register_message_handler(start_handler, commands=['start'])
dp.register_message_handler(help_handler, commands=['help'])
dp.register_message_handler(price_handler, lambda mes: mes.text == "Цена жизни в России", state = None)
dp.register_message_handler(learnUs_handler, lambda mes: mes.text == "О нас", state = None)
dp.register_message_handler(lovely_video, lambda mes: mes.text == "Лучшее видео", state = None)

dp.register_message_handler(echo_handler, state = None)


executor.start_polling(dp, skip_updates=True)
