list<Account> acc = [SELECT Id, Name, Type, Industry, AnnualRevenue
                FROM Account
                WHERE Type != null AND AnnualRevenue != null
                LIMIT 10];



string jst = JSON.serialize(acc);



system.debug(jst);



opportunity opp2 = [SELECT Id, Name, Type, StageName, Amount
                    FROM opportunity
                    WHERE Amount > 5000000
                    LIMIT 1];

string jst2 = JSON.serialize(opp2);
system.debug(jst2);



list<opportunity> opp3 = [SELECT Id, Name, Type, StageName, Amount
                    FROM opportunity
                    WHERE Amount != null
                    ORDER BY Amount DESC
                    LIMIT 10];

string  jst3 = JSON.serialize(opp3);
system.debug(jst3);
                    
