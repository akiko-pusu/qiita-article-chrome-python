FROM python:3
WORKDIR /workspace

# Chrome入れる
RUN sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get update && apt-get install -y google-chrome-stable

# Seleniumを入れる
RUN pip install selenium

#
# インストールしたChromeとPythonのchromedriver-binaryのバージョンが合わない
# 場合があるので、google-chromeのバージョン情報から バージョンの
# 近いものを pip installする
#
RUN google-chrome --version | perl -pe 's/([^0-9]+)([0-9]+\.[0-9]+).+/$2/g' > chrome-version
RUN pip install chromedriver-binary~=`cat chrome-version` && rm chrome-version

# フォントを追加（日本語のページをスクリーンショットする場合には追加）
#RUN apt-get install -y fonts-ipafont-gothic ttf-freefont --no-install-recommends
RUN apt-get install -y fonts-ipafont-gothic --no-install-recommends

CMD python /workspace/sample.py

