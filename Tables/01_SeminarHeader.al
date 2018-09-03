table 123456701 "CSD Seminar"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(10; "No."; Code[20])
        {
            Caption = 'Code';
            trigger OnValidate();
            begin

                if "No." <> xRec."No." then begin
                    SeminarSetup.GET;
                    NoSeriesMgt.TestManual(SeminarSetup."Seminary Nos.");
                    "No. Series" := '';
                end;
            end;


        }
        field(20; "Name"; Text[50])
        {
            Caption = 'Name';
            trigger OnValidate();
            begin
                IF("Search Name" = '') OR("Search Name" = Uppercase(xRec.Name)) then
                    "Search Name" := Name;
            end;

        }
        field(30; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
            DecimalPlaces = 0 : 1;

        }
        field(40; "Minimum Participants"; integer)
        {
            Caption = 'Minimum Participants';

        }
        field(50; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';

        }
        field(60; "Search Name"; Code[50])
        {
            Caption = 'Search Name';

        }
        field(70; "Blocked"; Boolean)
        {
            Caption = 'Blocked';

        }
        field(80; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = False;

        }
        field(90; "Comment"; Boolean)
        {
            Caption = 'Comment';
            Editable = False;

        }
        field(100; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;

        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate();
            begin
                if(xRec."Gen. Prod. Posting Group" <>
                "Gen. Prod. Posting Group") then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup
                (GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group",
                GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;

        }

        field(120; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";

        }
        field(130; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
            Editable = false;


        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {

        }
    }

    var
        SeminarSetup: Record "CSD Seminar Setup";

        GenProdPostingGroup: Record "Gen. Product Posting Group";

        NoSeriesMgt: Codeunit "NoSeriesManagement";

        //SeminarCommentLine: Record "CSD Seminar Comment Line";

        Seminar: Record "CSD Seminar";





    trigger OnInsert();
    begin

        if "No." = '' THEN begin
            SeminarSetup.get;
            SeminarSetup.TestField("Seminary Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminary Nos.", XRec."No. Series", 0D, "No.", "No. Series");
        end;

    end;

    trigger OnModify();
    begin
        "Last Date Modified" := TODAY;
    end;

    trigger OnDelete();
    begin
        //CommentLine.Reset;
        //CommentLine.SetRange("Table Name",
        //CommentLine."Table Name"::Seminar);
        //CommentLine.SetRange("No.","No.");
        // CommentLine.DeleteAll
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := TODAY;
    end;

    procedure AssistEdit(): Boolean;
    begin
        with Seminar do
        begin
            Seminar := Rec;
            SeminarSetup.get;
            SeminarSetup.TestField("Seminary Nos.");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminary Nos."
            , xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}