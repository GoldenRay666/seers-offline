.class Le22/c55/s88/b;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/Vaa;


# direct methods
.method constructor <init>(Le22/c55/s88/Vaa;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/c;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->a(Le22/c55/s88/Vaa;)Le22/c55/s88/ui/c;

    move-result-object v0

    invoke-virtual {v0}, Le22/c55/s88/ui/c;->dismiss()V

    :cond_0
    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-virtual {v0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-static {v0}, Le22/c55/s88/Vaa;->b(Le22/c55/s88/Vaa;)Le22/c55/s88/e/j;

    move-result-object v0

    const/4 v1, 0x0

    iput v1, v0, Le22/c55/s88/e/j;->O:I

    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->b(Le22/c55/s88/Vaa;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/f/a;->c(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-virtual {v0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    sget-object v1, Le22/c55/s88/f/e;->K:Ljava/lang/String;

    const/16 v2, 0xbb8

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    iget-object v1, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-static {v1}, Le22/c55/s88/Vaa;->b(Le22/c55/s88/Vaa;)Le22/c55/s88/e/j;

    move-result-object v1

    invoke-static {v0, v1}, Le22/c55/s88/Vaa;->a(Landroid/content/Context;Le22/c55/s88/e/j;)V

    iget-object v0, p0, Le22/c55/s88/b;->a:Le22/c55/s88/Vaa;

    invoke-virtual {v0}, Le22/c55/s88/Vaa;->a()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
