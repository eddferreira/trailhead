public class AccountTriggerHandler {
    //valida o numero do documento na inclusão ou atualização do registro
    public static void getNumeroDocumento(List<Account> Documento){
        List<Account> listaDoc = new List<Account>();

        for (Account numeroDocumento : Documento) {
            listaDoc.addAll(existeDocumento(numeroDocumento.Numero_Documento__c));

            if (!listaDoc.isEmpty()) {
                numeroDocumento.Numero_Documento__c.addError('Este numero de documento já existe para conta: ' + listaDoc.get(0).Name);
            }
        }  
    }

    //Verifica se já existe o documento da conta com o mesmo codigo
    public static List<Account> existeDocumento(String NumeroDoc){
        List<Account> listaConta = [select Name, Numero_Documento__c from Account where Numero_Documento__c =: NumeroDoc];

        return listaConta;
    }

    //Nçao permite a exclusão da conta
    public static void evitarExclusaoDeConta(List<Account> Conta){
        for (Account deletaConta : Conta) {
            deletaConta.addError('Exclusões de conta não são possíveis');
        }
    }
}