public class AccountTriggerHandler {
    public static void getNumeroDocumento(List<Account> Documento){
        List<Account> listaDoc = new List<Account>();

        for (Account numeroDocumento : Documento) {
            listaDoc.addAll(existeDocumento(numeroDocumento.Numero_Documento__c));

            if (!listaDoc.isEmpty()) {
                numeroDocumento.Numero_Documento__c.addError('Este numero de documento já existe para conta: ' + listaDoc.get(0).Name);
            }
        }  
    }

    public static List<Account> existeDocumento(String NumeroDoc){
        List<Account> listaConta = [select Name, Numero_Documento__c from Account where Numero_Documento__c =: NumeroDoc];

        return listaConta;
    }

    public static void evitarExclusaoDeConta(List<Account> Conta){
        for (Account deletaConta : Conta) {
            deletaConta.addError('Exclusões de conta não são possíveis');
        }
    }
}