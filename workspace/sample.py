#
# Chromeを入れてイメージを作成。その後コンテナで下記を実行。
# workspace/ ディレクトリにスクリーンショットが書き出されます。
#
# docker-compose build
# docker-compose run もしくは
# docker-compose run sample python /workspace/sample.py
#

import chromedriver_binary
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import datetime # yyyymmddHHMMSS のタイムスタンプをファイルに付ける

options = webdriver.ChromeOptions()
options.add_argument('--headless')
options.add_argument('--disable-gpu')

# 今回のDockerではrootで実行なのでこのオプションが必要
options.add_argument('--no-sandbox')

driver = webdriver.Chrome(options=options)

driver.get("https://www.google.com")
print(f'title is {driver.title}')

current_time = datetime.datetime.today()
current_time_str = current_time.strftime("%Y%m%d%H%M%S")

driver.save_screenshot(f'screenshot-full-{current_time_str}.png')

driver.quit()

