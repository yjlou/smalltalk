package pw.shhh.shhh;

import android.content.Intent;
import android.net.Uri;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        WebView myWebView = (WebView) findViewById(R.id.webview);
        myWebView.loadData( "Loading...", "text/html", "UTF-8");
        myWebView.getSettings().setJavaScriptEnabled(true);

        String url = "https://shhh.pw";

        // Get the intent that started this activity
        Intent intent = getIntent();

        if (intent != null) {
            Uri data = intent.getData();
            if (data != null && data.getScheme().startsWith("http")) {
                url = intent.getDataString();
            }
        }

        myWebView.loadUrl(url);
    }
}
