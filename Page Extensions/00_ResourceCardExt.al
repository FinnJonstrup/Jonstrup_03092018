pageextension 123456700 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")
            {
            }
        }

        addlast(Content)
        {
            group(Room)
            {
                field("CSD Maximum Participants"; "CSD Maximum Participants")
                {
                    Visible = Showmaxfield;
                }
                field("CSD Quantity Per Day"; "CSD Quantity Per Day")
                {
                    Visible = Showmaxfield;
                }

            }
        }



    }

    actions
    {
        // Add changes to page actions here
    }

    trigger OnAftergetrecord();
    begin
        showmaxfield := (rec.type = rec.type::Machine);
        CurrPage.Update(false);
    end;

    var
        [Indataset]
        showmaxfield: Boolean;
}