package net.java.dev.moskito.central;

import net.java.dev.moskito.central.starages.JdbcTest;

public class ConsoleTest {
    public static void main(String[] args) throws Exception {
    	new JdbcTest().testLocalJdbcStorage();
    }
}
