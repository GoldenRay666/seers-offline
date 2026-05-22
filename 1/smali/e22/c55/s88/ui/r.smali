.class Le22/c55/s88/ui/r;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/ui/n;


# direct methods
.method constructor <init>(Le22/c55/s88/ui/n;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5

    iget-object v0, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v0}, Le22/c55/s88/ui/n;->c(Le22/c55/s88/ui/n;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le22/c55/s88/e/j;

    const/16 v1, 0xe

    iput-byte v1, v0, Le22/c55/s88/e/j;->e:B

    new-instance v1, Le22/c55/s88/g/ac;

    iget-object v2, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v2}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v2

    const/4 v3, 0x3

    invoke-direct {v1, v2, v0, v3}, Le22/c55/s88/g/ac;-><init>(Landroid/app/Activity;Le22/c55/s88/e/j;I)V

    iget-object v2, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v2}, Le22/c55/s88/ui/n;->f(Le22/c55/s88/ui/n;)Le22/c55/s88/ui/d;

    move-result-object v2

    invoke-virtual {v1, v2}, Le22/c55/s88/g/ac;->a(Le22/c55/s88/ui/d;)V

    iget-object v2, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v2}, Le22/c55/s88/ui/n;->f(Le22/c55/s88/ui/n;)Le22/c55/s88/ui/d;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    const/4 v4, 0x2

    invoke-virtual {v2, v1, v3, v4}, Le22/c55/s88/ui/d;->a(Le22/c55/s88/ui/a;Le22/c55/s88/ui/n;I)V

    iget-object v1, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v1}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v1

    iget v2, v0, Le22/c55/s88/e/j;->h:I

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Le22/c55/s88/f/a;->b(Landroid/content/Context;II)Z

    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v2}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v2

    iget-object v3, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v3}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v3

    invoke-static {v3}, Le22/c55/s88/VManager;->getMainChildService(Landroid/content/Context;)Ljava/lang/Class;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    sget-object v2, Le22/c55/s88/f/e;->bI:Ljava/lang/String;

    const/16 v3, 0xd

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    iget-object v2, p0, Le22/c55/s88/ui/r;->a:Le22/c55/s88/ui/n;

    invoke-static {v2}, Le22/c55/s88/ui/n;->d(Le22/c55/s88/ui/n;)Le22/c55/s88/Vaa;

    move-result-object v2

    invoke-virtual {v2, v1}, Le22/c55/s88/Vaa;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    invoke-virtual {v0}, Le22/c55/s88/e/j;->b()V

    return-void
.end method
