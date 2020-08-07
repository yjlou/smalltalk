// Used for i18n
function ApplyI18N() {
  var userLang = navigator.language || navigator.userLanguage; 

  if (userLang.startsWith("zh")) {
    $("#short_desc").text("Small Talk 是一個幫你加密訊息的線上工具。");
    $("#read_more").text("... 閱讀更多");
    $("#detail_0").text("它非常適合和另外一個人，或是一群人，交換機密資訊或是秘密。透過事先約定好的密碼，就可以加密和解密訊息。");
    $("#detail_1").text("不知道密碼的人，就算拿到你送出來的連結，也就是沒有辦法解密訊息。這表示，就是算是政府，網路供應商，甚至是法院，都無法解密你的訊息。我們也沒有儲存你的密碼，所以我們也沒有辦法解密你的訊息。");
    $("#detail_2_0").text("你可以在這裡找到原始碼：");
    $("#detail_2_1").text("包括網頁及 Android App。");
    $("#detail_3").text("底下的圖是我們如何做加密和解密：");
    $("#detail_4").text("一些重點包括：");
    $("#detail_4_0").text("* 「提示」是可選用的，主要是用來提醒收訊人密碼是什麼。注意！提示「不會」被加密。");
    $("#detail_4_1").text("* 密碼是雙方事先約定好的。或是兩邊都知道的秘密。");
    $("#detail_4_2").text("* 加密時，會隨機產生一組 IV。這不只是用在產生加密密鑰，也用在加密過程當中。");
    $("#detail_4_3").text("* 密鑰是密碼和IV產生的，所以就算是一樣的密碼，每次使用的密鑰都會不一樣。");
    $("#detail_4_4").text("* 一樣的 IV 也用在加密的過程，以提高破解的難度。");
    $("#detail_4_5").text("* 加密後的訊息和 IV 可以用平常使用的聊天軟體，比方說：臉書，Line ...。就是一個加密過後的 URL。");
    $("#detail_4_6").text("* 收訊者點選 URL 後，會開啟解密用的網頁。");
    $("#detail_4_7").text("* 收訊者要做的事，就是輸入密碼。");
    $("#detail_4_8").text("* 然後，訊息就會在接收端被解密。");
    $("#detail_4_9").text("* 收訊者可以使用一樣的密碼回訊，或是另選一個密碼。");
    $("#detail_5").text("提醒！可能依然存有一些系統漏洞，有機會洩漏你的訊息。比方說：瀏覽器的插件，如果可以讀取網頁內容，就有機會偷取訊息。如果你有疑慮，請把他們關閉。");
    $("#i18n_decrypt").text("解密");
    $("#dec_hint_desc").text("提示：");
    $("#i18n_dec_pwd").text("在這裡輸入你的密碼");
    $("#btn_decrypt").text("解密");
    $("#i18n_descrypted_text").text("解密訊息：");
    $("#btn_reply").text("回覆");
    $("#enc_h2_encrypt").text("加密");
    $("#enc_h2_reply").text("回覆");
    $("#i18n_plain_text").text("輸入你想傳送的訊息(可以輸入很多行)。");
    $("#i18n_enc_hint").text("給對方的密碼提示。注意，這個提示不會被加密。");
    $("#i18n_enc_pwd").text("在這裡輸入你的密碼。");
    $("#btn_encrypt").text("加密");
    $("#i18n_url_for_share").text("傳送的 URL");
    i18n_url_copied = "URL 已經複製到剪貼簿了！";
    i18n_no_enc_key = "未提供密碼！";
    i18n_gen_too_long = "產生的 URL 太長了。你還是可以複製 URL，但是對方不一定可以完整收到訊息。";
    i18n_shorten_failed = "無法產生短網址。";
  }
}
