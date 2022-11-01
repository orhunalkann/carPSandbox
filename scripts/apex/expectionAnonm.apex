try{
    account ac= new Account();
    insert ac;
}catch(DmlException de){
    system.debug('DML went wrong');
}catch(Exception e){
    system.debug('Something went wrong');
}

//Below line will work because,The exception has catched .
system.debug('Apex is SIMPLE');