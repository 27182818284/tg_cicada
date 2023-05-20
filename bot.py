from aiogram import Bot, Dispatcher, executor
from aiogram.types import ReplyKeyboardMarkup, KeyboardButton, InlineKeyboardMarkup

API_TOKEN = ''

bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)


#КЛАВИАТУРЫ

# Главная клавиатура
kb_btns = [
    [KeyboardButton(text=''), KeyboardButton(text='')],
]
kb_main = ReplyKeyboardMarkup(keyboard=kb_btns, resize_keyboard=True)

   

# Хендлеры
async def start_handler(message):
    await message.answer('Привет \n Хочешь начать игру? \n чтобы начать напиши "начать игру"', reply_markup=kb_main) 
  
async def about_handler(message):
    await message.answer('Для тебя есть интересный квест \n чтобы начать напиши "начать игру"', reply_markup=kb_main)

#отправка первой головоломки
async def start_game():
    await bot.send_photo(photo=(""))




# Регистрация хендлеровр
dp.register_message_handler(start_handler, commands=['start'])
dp.register_message_handler(about_handler, lambda mes: mes.text == 'О нас')
dp.register_message_handler(start_game, lambda mes: mes.text == "начать игру")


# Запуск бота
executor.start_polling(dp, skip_updates=True)






