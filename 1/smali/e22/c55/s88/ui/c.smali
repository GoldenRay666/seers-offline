.class public Le22/c55/s88/ui/c;
.super Landroid/app/Dialog;


# instance fields
.field private a:Landroid/app/Activity;


# virtual methods
.method public onBackPressed()V
    .locals 2

    invoke-super {p0}, Landroid/app/Dialog;->onBackPressed()V

    iget-object v0, p0, Le22/c55/s88/ui/c;->a:Landroid/app/Activity;

    check-cast v0, Le22/c55/s88/Vaa;

    invoke-virtual {v0}, Le22/c55/s88/Vaa;->a()V

    iget-object v0, p0, Le22/c55/s88/ui/c;->a:Landroid/app/Activity;

    check-cast v0, Le22/c55/s88/Vaa;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Le22/c55/s88/Vaa;->a(Z)V

    return-void
.end method
