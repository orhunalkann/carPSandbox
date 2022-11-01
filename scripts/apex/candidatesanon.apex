candidates.companyName = 'Salesforce';

candidates c1 = new candidates();
c1.name = 'Marry';
c1.gender = 'Female';
c1.printCandidates();

candidates c2 = new candidates();
c2.name = 'Orhun';
c2.gender = 'Male';
c2.printCandidates();

candidates c3 = new candidates();
c3.name = 'Jake';
c3.gender = 'Female';
c3.printCandidates();

system.debug(candidates.counter);
