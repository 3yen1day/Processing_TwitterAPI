
//発表用プログラム
//以下setupまでおまじない
import twitter4j.*;
import twitter4j.api.*;
import twitter4j.auth.*;
import twitter4j.conf.*;
import twitter4j.json.*;
import twitter4j.management.*;
import twitter4j.util.*;
import twitter4j.util.function.*;


String consumerKey = "";
String consumerSecret = "";
String accessToken = "";
String accessTokenSecret = "";

Twitter twitter;
Query query1;
Query query2;
Query query3;
Query query4;
QueryResult result1;
QueryResult result2;
QueryResult result3;
QueryResult result4;

Survey sur;

void setup() {
  size(1000,300);
  textSize(40);
  ConfigurationBuilder cb = new ConfigurationBuilder();
  cb.setOAuthConsumerKey(consumerKey);
  cb.setOAuthConsumerSecret(consumerSecret);
  cb.setOAuthAccessToken(accessToken);
  cb.setOAuthAccessTokenSecret(accessTokenSecret);

  twitter = new TwitterFactory(cb.build()).getInstance();
  sur = new Survey();
}
//変数
int count=0;
int year = year();
int month = month();
int day = day();
int second = second();
int minute = minute();
int hour = hour();
int s1, s2, s3, s4;

void mousePressed() {
  count++;
  //1回クリックすると、クリック時の時間を変数に保存。もう1回クリックすると、1回目にクリックした時より後のツイートを数える
  if (count%2==1) {
    year = year();
    month = month();
    day = day();
    second = second();
    minute = minute();
    hour = hour();
    println("clickd!");
  } else {
    String sin = year+"-"+month+"-"+day+"_"+hour+":"+minute+":"+second+"_JST";//クリック時の時間を文字列として保存
    try {
      String[] searchWords1 = {"タグ", "ワード１"};//検索ワードの指定
      query1 = new Query();
      query1.setCount(50);//50ツイートまで取得
      query1.setQuery(String.join(" ", searchWords1));//検索ワードのセット
      query1.since(sin);//時間指定
      result1 = twitter.search(query1);//検索
      println("ヒット数 : " + result1.getTweets().size());//ヒット件数
      s1=result1.getTweets().size();

      String[] searchWords2 = {"タグ", "ワード2"};//検索ワードの指定
      query2 = new Query();
      query2.setCount(50);//50ツイートまで取得
      query2.setQuery(String.join(" ", searchWords2));//検索ワードのセット
      query2.since(sin);//時間指定

      result2 = twitter.search(query2);//検索
      println("ヒット数 : " + result2.getTweets().size());//ヒット件数
      s2=result2.getTweets().size();

      String[] searchWords3 = {"タグ", "ワード3"};//検索ワードの指定
      query3 = new Query();
      query3.setCount(50);//50ツイートまで取得
      query3.setQuery(String.join(" ", searchWords3));//検索ワードのセット
      query3.since(sin);//時間指定

      result3 = twitter.search(query3);//検索
      println("ヒット数 : " + result3.getTweets().size());//ヒット件数
      s3=result3.getTweets().size();

      String[] searchWords4 = {"タグ", "ワード4"};//検索ワードの指定
      query4 = new Query();
      query4.setCount(50);//50ツイートまで取得
      query4.setQuery(String.join(" ", searchWords4));//検索ワードのセット
      query4.since(sin);//時間指定

      result4 = twitter.search(query4);//検索
      println("ヒット数 : " + result4.getTweets().size());//ヒット件数 
      s4=result4.getTweets().size();
    }
    //catch(){}ないとバグる
    catch(TwitterException e) {
      println("Search tweets : " + e);
    }
  }
}

void draw() {
}

void keyPressed() {
  if (key == TAB) { 
    background(255);
    sur.display(100,50,s1,s2,s3,s4);
  }
}