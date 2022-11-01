IF(  
    ISPICKVAL(Support_Tier__c , 'Gold')   &&  
                (AnnualRevenue = $CustomMetadata.Support_Tier__mdt.Gold.Minimum_Spending__c * 20), true, false)