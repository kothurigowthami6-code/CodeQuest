
package com.codequest.util;

public class AdminPasswordGenerator {

    public static void main(String[] args) {

        String password = "Admin@123";

        String hashedPassword =
                PasswordUtil.hashPassword(password);

        System.out.println("Admin Password Hash:");
        System.out.println(hashedPassword);
    }
}
