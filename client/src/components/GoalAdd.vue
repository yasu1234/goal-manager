<template>
    <v-app>
        <div class="editor">
            <input type="text" id="Name" name="Name" placeholder="タイトル">
        </div>
        <div class="editor">
            <mavon-editor language="ja" :toolbars="markdownOption"/>
        </div>

    </v-app>
</template>

<script>


export default {
    data() {
        return {
            markdownOption: {
                bold: true,
                italic: true,
                header: true,
                underline: true,
                strikethrough: true,
                mark: false,
                superscript: false,
                subscript: false,
                quote: true,
                ol: true,
                ul: true,
                link: true,
                imagelink: false,
                code: true,
                table: true,
                fullscreen: false,
                readmodel: true,
                htmlcode: true,
                help: true,
                undo: true,
                redo: true,
                trash: false,
                save: false,
                navigation: false,
                alignleft: false,
                aligncenter: false,
                alignright: false,
                subfield: true,
                preview: true
            },
        };
    },
    components: {
    }
}
</script>

<style>
.editor{
   padding: 30px;
 }

 input[type=text] {
  width: 100%;
  padding: 12px 12px;
  margin: 8px 0;
  box-sizing: border-box;
  border: 1px solid #ccc;
  border-radius: 4px;
}

</style>
