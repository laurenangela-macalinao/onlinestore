package model;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import org.apache.commons.codec.binary.*;

public class Security {

    private static byte[] key = {
        //Severe:   Invalid AES key length: 10 bytes
        //0x73,0x65,0x63,0x72,0x65,0x74,0x6f,0x69,0x74,0x6f
        //secretoito
        
        0x74, 0x68, 0x69, 0x73, 0x49, 0x73, 0x41, 0x53, 
        0x65, 0x63, 0x72, 0x65, 0x74, 0x4b, 0x65, 0x79
         // thisisasecretkey
    };

   public static String encrypt(String strToEncrypt) {
           String encryptedString = null;
           try {
                   Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
                   final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
                   cipher.init(Cipher.ENCRYPT_MODE, secretKey);
                   encryptedString = Base64.encodeBase64String(cipher.doFinal(strToEncrypt.getBytes()));
           } catch (Exception e) {
                   System.err.println(e.getMessage());
           }
           System.out.println("encrypt(" + strToEncrypt + ") -> " + encryptedString);
           return encryptedString;
   }

   public static String decrypt(String codeDecrypt){
           String decryptedString = null;
           try{
                   Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5PADDING");
                   final SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
                   cipher.init(Cipher.DECRYPT_MODE, secretKey);
                   decryptedString = new String(cipher.doFinal(Base64.decodeBase64(codeDecrypt)));
           } catch (Exception e) {
                   System.err.println(e.getMessage());
           }
           System.out.println("decrypt(" + codeDecrypt + ") -> " + decryptedString);
           return decryptedString;
   }	
}