.class Le22/c55/s88/g/aa;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field final synthetic a:Le22/c55/s88/g/z;


# direct methods
.method constructor <init>(Le22/c55/s88/g/z;)V
    .locals 0

    iput-object p1, p0, Le22/c55/s88/g/aa;->a:Le22/c55/s88/g/z;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Le22/c55/s88/g/aa;->a:Le22/c55/s88/g/z;

    invoke-static {v0}, Le22/c55/s88/g/z;->a(Le22/c55/s88/g/z;)Z

    move-result v0

    if-nez v0, :cond_0

    check-cast p1, Landroid/widget/TextView;

    sget-object v0, Le22/c55/s88/f/e;->ag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Le22/c55/s88/g/aa;->a:Le22/c55/s88/g/z;

    invoke-virtual {v0}, Le22/c55/s88/g/z;->b()V

    :cond_0
    return-void
.end method
