/**
 * API from Fixer.io, which can use http entity to get a json object of the rate of today. 
 * And have only 30 currency including USD GBP CNY EUR HKD... 
 * If need more currency, use another api.
 */
package com.le.ac.project.tool;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import org.apache.http.HttpEntity;
import org.apache.http.ParseException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONException;
import org.json.JSONObject;

public class CurrencyExchange{

    // essential URL structure is built using constants
    public static final String BASE_URL = "http://api.fixer.io/latest?base=";

    // this object is used for executing requests to the (REST) API
    static CloseableHttpClient httpClient = HttpClients.createDefault();

    
    /**
     * 
     * Notes:
     * 
     * A JSON response of the form {"key":"value"} is considered a simple Java JSONObject.
     * To get a simple value from the JSONObject, use: <JSONObject identifier>.get<Type>("key");
     * 
     * A JSON response of the form {"key":{"key":"value"}} is considered a complex Java JSONObject.
     * To get a complex value like another JSONObject, use: <JSONObject identifier>.getJSONObject("key")
     * 
     * Values can also be JSONArray Objects. JSONArray objects are simple, consisting of multiple JSONObject Objects.
     * 
     * 
     */
     

    //to request and retrieve the data
    /**
     * Must use currency short form in 3 digits upper case: USD, GBP, CNY...
     * example of 1 US dollar to GB pound--Double rate = sendLiveRequest("USD", "GBP");
     * @param srcCur refer to the source currency
     * @param tarCur refer to the target currency
     * @return Double
     * @author Lin
     */
    public Double getCurrencyRate(String srcCur, String tarCur){

        //initializes the HttpGet Object with the URL in order to send a request
        HttpGet get = new HttpGet(BASE_URL+srcCur);
        
        try {
            CloseableHttpResponse response =  httpClient.execute(get);
            HttpEntity entity = response.getEntity();

            // the following line converts the JSON Response to an equivalent Java Object
            JSONObject exchangeRates = new JSONObject(EntityUtils.toString(entity));
            System.out.println(exchangeRates.toString());
            // Parsed JSON Objects are accessed according to the JSON resonse's hierarchy, output strings are built
            Double rate = exchangeRates.getJSONObject("rates").getDouble(tarCur);
            response.close();
            return rate;
        } catch (ClientProtocolException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (JSONException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
			httpClient.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
    }
    
        // sendLiveRequest() function is executed
//    public static void main(String[] args) throws IOException{
//    		//for testing
//    	CurrencyExchange currencyExchange = new CurrencyExchange();
//        Double rate = currencyExchange.getCurrencyRate("USD", "GBP");
//        System.out.println(rate);
//        httpClient.close();
//        new BufferedReader(new InputStreamReader(System.in)).readLine();
//    }
}