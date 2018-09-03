table 123456700 "CSD Seminar Setup"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(20; "Seminary Nos."; Code[20])
        {
            Caption = 'Seminary Nos.';
            TableRelation = "No. Series";
        }
        field(30; "Seminary Registration Nos."; Code[20])
        {
            Caption = 'Seminary Registration Nos.';
            TableRelation = "No. Series";
        }
        field(40; "Posted Seminary Reg. Nos."; Code[20])
        {
            Caption = 'Posted Seminary Reg. Nos.';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    

}