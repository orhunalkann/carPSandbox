public with sharing class SoapCallOuts {
    public static String[] getParksbyCountry (String country) {
        ParksServices.ParksImplPort pc = new ParksServices.ParksImplPort();
        string[] parks = pc.byCountry(country);
        system.debug(parks);
        return parks;
    }
}
