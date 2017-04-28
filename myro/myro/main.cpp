#include <fstream>
#include <iostream>
using namespace std;

struct element{
public:
    int x;
    int y;
};

class Stack{
public:
    int top;
    int size;
    element* items;
    
    Stack(int size){
        this->size = size;
        top = 0;
        items= new element[size];
    }
    
    bool is_full(){
        if(top == size){
            return true;
        }else
            return false;
    }
    
    bool is_empty(){
        if(top == 0){
            return true;
        }else
            return false;
        
    }
    
    void push(element e){
        if(is_full()){
            cout<<"stack is full";
        }
        else{
            memcpy(&items[top],&e,sizeof(element));
            top++;
        }
    }
    
    element pop(){
        if(is_empty()){
            element k;
            k.x = -100;
            k.y = -100;
            return k;
        }else{
            top--;
            return items[top];
        }
    }
    
};


int main(){
    
    
    fstream fs("/Users/jwh/Downloads/test.txt");
    cout<<"gi";
    int x, y;
    
    fs >> x >> y;
    
    Stack path(x*y);
    
    int maze[x][y];
    
    for(int i = 0; i<x; i++){
        for(int j =0; j<y; j++){
            int n;
            fs >> n;
            maze[i][j]=n;
        }
    }
    element entry,exit;
    
    fs >> entry.x >> entry.y >> exit.x >> exit.y;
    
    //element kkk = exit;
    
    //cout<< "kkk value" << kkk.x<<kkk.y;
    
    path.push(entry);
    
    
    bool found = false;
    while(!path.is_empty() && !found){
        element curr = path.pop();
        if(memcmp(&curr,&exit,sizeof(curr))==0){
            found = true;
            path.push(curr);
            
        }
        break;
    }
    
    
    return -1;
}
