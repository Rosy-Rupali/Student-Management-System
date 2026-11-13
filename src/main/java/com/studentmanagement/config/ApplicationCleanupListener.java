
package com.studentmanagement.config;

import com.mysql.cj.jdbc.AbandonedConnectionCleanupThread;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;

@WebListener
public class ApplicationCleanupListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent event) {

        try {
            AbandonedConnectionCleanupThread.checkedShutdown();
            System.out.println("MySQL cleanup thread stopped successfully.");
        } catch (Exception e) {
            System.err.println("Error stopping MySQL cleanup thread: "
                    + e.getMessage());
        }
    }
}
