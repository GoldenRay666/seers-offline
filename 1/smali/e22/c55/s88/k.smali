.class Le22/c55/s88/k;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:Le22/c55/s88/j;


# direct methods
.method constructor <init>(Le22/c55/s88/j;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/k;->a:Le22/c55/s88/j;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    sget-object v1, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v1, p0, Le22/c55/s88/k;->a:Le22/c55/s88/j;

    iget-object v1, v1, Le22/c55/s88/j;->a:Le22/c55/s88/Vrr;

    invoke-static {v1}, Le22/c55/s88/Vrr;->a(Le22/c55/s88/Vrr;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1, v0}, Le22/c55/s88/Vrr;->a(Landroid/content/Context;Landroid/content/Intent;)V

    return-void
.end method
