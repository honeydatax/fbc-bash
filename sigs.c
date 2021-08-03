#include <sys/types.h>
#include <signal.h>
void kills(int p,int sig){
	kill((pid_t) p,sig);
}



