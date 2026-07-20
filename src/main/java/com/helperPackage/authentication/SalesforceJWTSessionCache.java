package com.helperPackage.authentication;

public final class SalesforceJWTSessionCache {
    private static final long TTL = 150000;
    private static final ThreadLocal<CachedSession> SESSION =new ThreadLocal<>();
    private SalesforceJWTSessionCache(){}
    public static SalesforceJWTAuthResponse get(){
        CachedSession cached = SESSION.get();
        if(cached == null)
            return null;
        if(System.currentTimeMillis()-cached.time > TTL){
            SESSION.remove();
            return null;
        }
        return cached.response;
    }

    public static void put(SalesforceJWTAuthResponse response){
        SESSION.set(
                new CachedSession(
                        response,
                        System.currentTimeMillis()));
    }

    public static void clear(){
        SESSION.remove();
    }

    private static class CachedSession{
        SalesforceJWTAuthResponse response;
        long time;
        CachedSession(SalesforceJWTAuthResponse response,long time){
            this.response=response;
            this.time=time;
        }
    }
}