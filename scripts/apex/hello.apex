// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

//Aggregate function
List<AggregateResult> groupedResult = [SELECT StageName, MIN(Amount), MAX(Amount), AVG(Amount) FROM Opportunity GROUP BY StageName];

for(AggregateResult result: groupedResult){
    System.debug('StageName: '+result.get('StageName') + ' Min Amount: '+result.get('expr0')+ ' Max Amount: '+result.get('expr1')+ ' Avg Amount: '+result.get('expr2'));
}

// When using alias for aggregate functions
List<AggregateResult> groupedResult = [SELECT StageName, MIN(Amount) minAmount , MAX(Amount) maxAmount, AVG(Amount) avgAmount FROM Opportunity GROUP BY StageName];

for(AggregateResult result: groupedResult){
    System.debug('StageName: '+result.get('StageName') + ' Min Amount: '+result.get('minAmount')+ ' Max Amount: '+result.get('maxAmount')+ ' Avg Amount: '+result.get('avgAmount'));
}