---------------------------------------------------------------
---                    Helper functions                     ---
---------------------------------------------------------------

-- FIXME: Still unsure how to translate this into Lua (or if I even should)

-- Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
    then
        buffer #
    else
        bnext
    end

    if bufnr("%") == l:currentBufNum
    then
        new
    end

    if buflisted(l:currentBufNum)
    then
        execute("bdelete! ".l:currentBufNum)
    end
end
