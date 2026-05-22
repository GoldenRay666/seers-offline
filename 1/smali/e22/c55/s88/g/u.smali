.class Le22/c55/s88/g/u;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/s;


# direct methods
.method constructor <init>(Le22/c55/s88/g/s;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    invoke-static {v0}, Le22/c55/s88/g/s;->c(Le22/c55/s88/g/s;)Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;Z)Landroid/widget/FrameLayout;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setContentView(Landroid/view/View;)V

    iget-object v0, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;I)I

    iget-object v0, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    iget-object v1, p0, Le22/c55/s88/g/u;->a:Le22/c55/s88/g/s;

    invoke-static {v1}, Le22/c55/s88/g/s;->a(Le22/c55/s88/g/s;)I

    move-result v1

    invoke-virtual {v0, v1}, Le22/c55/s88/g/s;->a(I)V

    return-void
.end method
