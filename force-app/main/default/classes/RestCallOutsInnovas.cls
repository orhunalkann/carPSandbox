public with sharing class RestCallOutsInnovas {
    
    //GET METHODS
    
    
    public static HttpResponse getAnimals() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);

        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getStatus());
            System.debug(response.getBody());
        }
        return response;
    }

    public static HttpResponse getBlogs(){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://mockyard.herokuapp.com/blogs');
        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            system.debug(response.getBody());
            system.debug(response.getStatus());
            string jString = response.getBody();
            list<BlogWrapper> wrappers = (list<BlogWrapper>) JSON.deserialize(jString, list<BlogWrapper>.class);


            //convert the blog wrappers into blog sObjects
            list<blog__c> blogs = new List<blog__c>();
            for(BlogWrapper wrapper : wrappers) {
                Blog__c blog = new Blog__c();
                blog.author__c = wrapper.author;
                blog.title__c = wrapper.title;
                blog.body__c = wrapper.body;
                blog.topic__c = wrapper.topic;
                blogs.add(blog);
            }
            try{
                insert blogs;
            }catch(Exception e){
                system.debug(e.getMessage());
            }
        

        }return response;
    }

    public static HttpResponse getProducts() {
        //1. Prepare HttpRequest and wrap the necessary information in it
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://mockyard.herokuapp.com/products');
    
        //2. Prepare internet
        Http http = new Http();
    
        //3. Send the request over the internet to receive response
        HttpResponse response = http.send(request);
    
        //4. Process the response
        if(response.getStatusCode() == 200) {
            System.debug(response.getBody());
            
            //convert the json string into apex type
            String jsonString = response.getBody();
            List<ProductWrapper> wrappers = (List<ProductWrapper>)JSON.deserialize(jsonString, List<ProductWrapper>.class);
    
            List<Ecommerce_Product__c> products = new List<Ecommerce_Product__c>();
            
            for(ProductWrapper pw : wrappers) {
                Ecommerce_Product__c prod = new Ecommerce_Product__c();
                prod.Product_Name__c = pw.name;
                prod.Image__c = pw.image;
                String amount = pw.price.substring(1); //$260.82 => 260.82
                prod.Price__c = Double.valueOf(amount);
                prod.Description__c = pw.description;
                prod.Category__c = pw.category;
                prod.Introduced_Date__c = Date.today();
                prod.Name = pw.productId;
                products.add(prod);    
            }
    
            //insert products
            try {
                insert products;
            } catch(Exception ex) {
                //create log
                System.debug(ex.getMessage());
            }
        }
        return response;
    
    }


    public static HttpResponse getContactUsers(){
        HttpRequest request = new HttpRequest();
        request.setMethod('GET');
        request.setEndpoint('https://mockyard.herokuapp.com/users');

        Http http = new Http();
        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200){
            system.debug('Worked');
            //system.debug(response.getBody());
            list<userToContactWrapper> wrapped = (list<userToContactWrapper>)JSON.deserialize(response.getBody(),list<userToContactWrapper>.class);
            list<contact> conList = new list<contact>();
            for(userToContactWrapper wrp : wrapped){
                Contact ctn = new Contact();
                ctn.Age__c = wrp.age;
                ctn.image__c = wrp.image;
                ctn.gender__c = wrp.gender;
                ctn.email = wrp.email;
                ctn.phone = wrp.phone;
                string[] names = wrp.name.split(' ');
                ctn.firstName = names[0];
                ctn.lastName = names[1];
                conList.add(ctn);
            }

            try{
                insert conList;
            }catch(Exception ex){
                system.debug(ex.getMessage());
            }

        }
        return response;
    }

    }