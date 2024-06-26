﻿------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Empty_Popup(callback, sw, sh)
    sw = sw or 500
    sh = sh or 250
    CreateOverBlur(
        function(blur)
            frame = blur:Add("WolfFrame")
            frame:SetSize(sw, sh)
            frame:Center()
            frame:MakePopup()
            function frame:OnRemove()
                blur:SmoothClose()
            end

            if callback then callback(frame) end
        end
    )
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function String_Request(question, ok, _, numeric)
    question = question or "Unset Question"
    numeric = numeric or false
    Empty_Popup(
        function(frame)
            local wp = frame:GetWorkPanel()
            wp.q = wp:Add("DLabel")
            wp.q:SetText(question)
            wp.q:SetFont("WB_Small")
            wp.q:SetColor(color_white)
            wp.q:SizeToContents()
            wp.q:CenterHorizontal()
            wp.q:CenterVertical(0.25)
            wp.te = wp:Add("DTextEntry")
            wp.te:SetFont("WB_Small")
            wp.te:SetSize(200, 30)
            wp.te:Center()
            wp.te:SetNumeric(numeric)
            function wp.te:Paint(w, h)
                draw.RoundedBox(4, 0, 0, w, h, Color(245, 245, 245))
                self:DrawTextEntryText(color_black, Color(200, 200, 200), color_black)
            end

            wp.done = wp:Add("DButton")
            wp.done:SetText("Done")
            wp.done:SetFont("WB_Small")
            wp.done:SetColor(color_white)
            wp.done:SetSize(150, 30)
            wp.done:CenterHorizontal()
            wp.done:CenterVertical(0.75)
            wp.done:SetColorAcc(BC_NEUTRAL)
            wp.done:SetupHover(getHovCol(BC_NEUTRAL))
            function wp.done:Paint(w, h)
                draw.RoundedBox(4, 0, 0, w, h, self.color)
            end

            function wp.done:DoClick()
                frame:Close()
                if ok and isfunction(ok) then ok(wp.te:GetText()) end
            end
        end
    )
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Choice_Request(question, yes, no, modify)
    question = question or "Unset Question"
    Empty_Popup(
        function(frame)
            frame:SetTitle("")
            local wp = frame:GetWorkPanel()
            wp.q = wp:Add("DLabel")
            wp.q:SetText(question)
            wp.q:SetFont("WB_Small")
            wp.q:SetColor(color_white)
            wp.q:SizeToContents()
            wp.q:CenterHorizontal()
            wp.q:CenterVertical(0.25)
            local function addChoice(title)
                local b = wp:Add("DButton")
                b:SetText(title)
                b:SetSize(80, 35)
                b:SetFont("WB_Small")
                b:SetColor(color_black)
                b:CenterVertical(0.65)
                b:SetColorAcc(Color(245, 245, 245))
                b:SetupHover(Color(255, 255, 255))
                function b:Paint(w, h)
                    draw.RoundedBox(4, 0, 0, w, h, self.color)
                end
                return b
            end

            wp.yes = addChoice("Yes")
            wp.yes:CenterHorizontal(0.30)
            function wp.yes:DoClick()
                frame:Close()
                if yes then yes() end
            end

            wp.no = addChoice("No")
            wp.no:CenterHorizontal(0.70)
            function wp.no:DoClick()
                frame:Close()
                if no then no() end
            end

            if modify and isfunction(modify) then modify(wp) end
        end
    )
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Important_Notification(message)
    Empty_Popup(
        function(frame)
            local wp = frame:GetWorkPanel()
            local g = group()
            g.msg = wp:Add("DLabel")
            g.msg:SetText(message)
            g.msg:SetFont("WB_Medium")
            g.msg:SetTextColor(color_white)
            g.msg:SizeToContents()
            g.msg:Center()
            g.cont = wp:Add("WButton")
            g.cont:SetText("Continue")
            g.cont:SetAccentColor(BC_NEUTRAL)
            g.cont:Dock(BOTTOM)
            g.cont:SetSize(frame:GetWide(), 30)
            function g.cont:DoClick()
                self:GInflate(nil, true)
                timer.Simple(0.4, function() frame:Close() end)
            end

            g:FadeIn()
        end
    )
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
