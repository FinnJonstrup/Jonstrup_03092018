page 123456700 "CSD Seminar Setp"
{
    PageType = Card;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';
    InsertAllowed = False;
    DeleteAllowed = false;
    UsageCategory = Administration;
    layout
    {
        area(content)
        {
            group(Numbering)
            {
                field("Seminary Nos.";"Seminary Nos.")
                {

                }
                field("Seminary Registration Nos.";"Seminary Registration Nos.")
                {

                }
                field("Posted Seminary Reg. Nos.";"Posted Seminary Reg. Nos.")
                {

                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionName)
            {
                trigger OnAction();
                begin
                end;
            }
        }
    }

    var
        myInt: Integer;
        trigger OnOpenPage();
        begin
            if not get then begin
                init;
                insert;

            end;
            

        end;
}