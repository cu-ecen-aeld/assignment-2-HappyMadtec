#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <syslog.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    openlog(argv[0], LOG_PID | LOG_CONS, LOG_USER);
  if (argc){
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Not enough arguments\n");
        closelog();
        return 1;
        
    } else {
        if (strncmp(argv[1], "/", 1) == 0) {
            syslog(LOG_INFO, "This is an absolute path\n");

            char directory_name[256];
            char file_name[256];
            if (argv[2] == NULL) {
        syslog(LOG_ERR, "Error: No string to write specified\n");
        closelog();
        return 1;
    }
            char *last_slash = strrchr(argv[1], '/');
            if (last_slash != NULL) {
                strncpy(directory_name, argv[1], last_slash - argv[1]);
                directory_name[last_slash - argv[1]] = '\0';
                strcpy(file_name, last_slash + 1);

                printf("Directory: %s\n", directory_name);
                printf("Filename: %s\n", file_name);

                if (access(directory_name, F_OK) == 0) {
                    syslog(LOG_INFO, "Accessing directory\n");

                    if (chdir(directory_name) == 0) {
                        syslog(LOG_INFO, "Directory accessed\n");

                        if (access(file_name, F_OK) == 0) {
                            FILE *file = fopen(file_name, "w");
                            if (file != NULL) {
                                fprintf(file, "%s\n", argv[2]);
                                syslog(LOG_INFO, "Writing '%s' to '%s'\n", argv[2], file_name);
                                fclose(file);
                                syslog(LOG_INFO, "Text message written to file\n");
                            } else {
                                syslog(LOG_ERR, "Error opening file for writing\n");
                            }
                        } else {
                            syslog(LOG_INFO, "File doesn't exist...creating new file\n");
                            FILE *file = fopen(file_name, "w");
                            if (file != NULL) {
                                fprintf(file, "%s\n", argv[2]);
                                syslog(LOG_INFO, "Writing '%s' to '%s'\n", argv[2], file_name);
                                fclose(file);
                                syslog(LOG_INFO, "Text written to file\n");
                            } else {
                                syslog(LOG_ERR, "Error creating new file\n");
                            }
                        }
                    } else {
                        syslog(LOG_ERR, "Error changing directory\n");
                    }
                } else {
                    syslog(LOG_ERR, "Error, can't access directory\n");
                }
            } else {
                syslog(LOG_ERR, "Error, Invalid path format\n");
            }
        }
    }
    }

    closelog();
    return 0;}
    else{
    return 1;}
}
